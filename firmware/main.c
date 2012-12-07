#include <stdlib.h>
#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "Delay.h"
#include "usb_config.h"
#include "USB/usb.h"
#include "USB/usb_host_generic.h"
#include "user.h"
#include "timer.h"
#include "tinymodules/tprintf.h"
#include "tinymodules/tsprintf.h"
#include "microbridge/Adb_pic.h"

#define PLL_96MHZ_OFF   0xFFFF
#define PLL_96MHZ_ON    0xF7FF

// for PIC24FJ64GB002
_CONFIG1(WDTPS_PS1 & FWPSA_PR32 & WINDIS_OFF & FWDTEN_OFF & ICS_PGx1 & GWRP_OFF & GCP_OFF & JTAGEN_OFF)
_CONFIG2(OSCIOFNC_OFF & POSCMOD_NONE & I2C1SEL_PRI & IOL1WAY_OFF & OSCIOFNC_ON & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_ON & PLLDIV_DIV2 & IESO_OFF)
_CONFIG3(WPFP_WPFP0 & SOSCSEL_IO & WUTSEL_LEG & WPDIS_WPDIS & WPCFG_WPCFGDIS & WPEND_WPENDMEM)
_CONFIG4(DSWDTPS_DSWDTPS3 & DSWDTOSC_LPRC & RTCOSC_SOSC & DSBOREN_OFF & DSWDTEN_OFF)

extern BYTE deviceAddress; // Address of the device on the USB
void uart2_puts(char*);
void lprint(char* str, int len);
void initPeripheral(void);

static void setServoAngle(int ServoNo, int Angle);
//static boolean datareceived = false;
static boolean AdbDataReceiveFlg = false;

#define ADB_STRING_LOGCAT       "shell:exec logcat"
#define ADB_STRING_GET_LOADAVG	"shell:exec cat /proc/loadavg"
#define ADB_STRING_GET_MEMINFO	"shell:exec cat /proc/meminfo"

/*
// commands definition
#define COMMAND_LED_ON          0x30
#define COMMAND_LED_OFF         0x31
#define COMMAND_SERVO_POS1      0x40
#define COMMAND_SERVO_POS2      0x41
#define COMMAND_SERVO_POS3      0x42
#define COMMAND_MOTOR_CW        0x50
#define COMMAND_MOTOR_CCW       0x51
#define COMMAND_MOTOR_STOP      0x52
*/

typedef enum {
	MOTOR_FORWARD = 0,
	MOTOR_BACKWARD,
	MOTOR_BRAKE,
	MOTOR_STOP
} MotorControl;

//const unsigned char command_code[] = "get\n";

//int receivedCommand;
int applicationLaunchState = false;
int applicationLaunched = false;
Connection* AdbC;
uint8_t RecvData[256];

//***********************************************
// Starting Activity
//***********************************************
int StartingActivity(const char* activityName)
{
char ac[256];
int ret = 0;
    applicationLaunched = false;
    strcpy( ac, "shell:am start -n " );
    strcat( ac, activityName );
    Connection *con = ADB_addConnection( ac, false);
    int i;
    for(i=0;i<40;i++){
        ADB_poll(con);
        if(applicationLaunched == true){
            ret = 1;
            break;
        }
        LATBbits.LATB2 = 0;
        LATBbits.LATB15 = 0;
        DelayMs(50);
        LATBbits.LATB2 = 1;
        LATBbits.LATB15 = 1;
        DelayMs(20);
    }
    applicationLaunched = true;
    ADB_delConnection(con);
    return ret;
}
//***********************************************
// tcp Forward
//***********************************************
Connection* tcpForward(const char* port)
{
char ac[128];
    strcpy( ac, "tcp:" );
    strcat( ac, port );
    Connection *con = ADB_addConnection( ac, false);
    AdbDataReceiveFlg = false;
    int i;
    while(true){
        for(i=0;i<6;i++){
            ADB_poll(con);
            if(AdbDataReceiveFlg == true){
                break;
            }
            LATBbits.LATB2 = 1;
            LATBbits.LATB15 = 1;
            DelayMs(20);
            LATBbits.LATB2 = 0;
            LATBbits.LATB15 = 0;
            DelayMs(100);
        }
        if(AdbDataReceiveFlg==true){
            break;
        }
        ADB_delConnection(con);
        DelayMs(50);
        con = ADB_addConnection( ac, false);
    }
    return con;
}

//***********************************************
// main
//***********************************************
int main(void) {

    {
        //CLKDIV　bit 10-8
        //RCDIV2:RCDIV0: FRC Postscaler Select bits
        //　111 = 31.25 kHz (divide by 256)
        //　110 = 125 kHz (divide by 64)
        //　101 = 250 kHz (divide by 32)
        //　100 = 500 kHz (divide by 16)
        //　011 = 1 MHz (divide by 8)
        //　010 = 2 MHz (divide by 4)
        //　001 = 4 MHz (divide by 2)
        //　000 = 8 MHz (divide by 1)
        CLKDIV = 0;     //8MHz
        unsigned int pll_startup_counter = 600;
        CLKDIVbits.PLLEN = 1;           //96MHzPLL有効化ビットをセットする
        while (pll_startup_counter--);  //PLLが安定するまで待つ
    }

    // Configure U2RX - put on pin 17 (RP8)
    RPINR19bits.U2RXR = 8;
    // Configure U2TX - put on pin 16 (RP7)
    RPOR3bits.RP7R = 5;
    TRISAbits.TRISA0 = 1; // PORT A0 -> INPUT
    TRISBbits.TRISB3 = 0;   //PORT B3 -> OUTPUT

    UART2Init();
    tprintf_SetCallBack(uart2_puts);

    initPeripheral();

    tprintf("\x1b[m" "**********************************************\r\n");
    tprintf(" PIC_microbridge_Cleaner Ver 1.32 @momoonga\r\n");
    tprintf(" SYSTEM STARTED Build:%s %s\r\n", __DATE__, __TIME__);
    tprintf("**********************************************\r\n");
    DelayMs(1500);

    //Robot Initialize
    {
        //Gear Standby
        setServoAngle(0,160);
        //Motor Stop
        OC4R = 0;
        OC5R = 0;
        setMotorControl(0,MOTOR_STOP);
        DelayMs(500);  //This wait-command is necessary.
    }

    //initialize ADB module
    if( ADB_init()==-1){
        while(1){
            LATBbits.LATB2 = 1;
            LATBbits.LATB15 = 1;
            DelayMs(100);
            LATBbits.LATB2 = 0;
            LATBbits.LATB15 = 0;
            DelayMs(200);
        }
    }
    DelayMs(1000);

    if(StartingActivity("com.momoonga.luarida.robotscript/.RobotScriptActivity")==1){
        DelayMs(3000);
    }
    //StartingActivity("com.momoonga.marida/.MaridaActivity");
    //StartingActivity("jp.yishii.microbridgesample/.MicrobridgeSampleActivity");

    tprintf(" application launched\r\n");

    AdbC = tcpForward("60101");
    //DelayMs(1000);

    unsigned int power = 0;
    AdbDataReceiveFlg = false;
    int ConnectFlg = false;
    while (1) {
        ADB_poll(AdbC);
        if (AdbDataReceiveFlg == true) {
            tprintf("receivedCommand = %Xh %Xh\r\n", RecvData[0], RecvData[1]);
            power = (unsigned int)RecvData[1];
            if( power>0x80 )    power = 0x80;
            switch(RecvData[0]){
                case 'F':
                    //Just Stop
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Straight Gear
                    setServoAngle(0,90);
                    OC4R = power;
                    OC5R = power;
                    setMotorControl(0,MOTOR_FORWARD);
                    //LED ON
                    LATBbits.LATB2 = 1;
                    LATBbits.LATB15 = 1;
                    //RecvData[0] = 'R';
                    break;
                case 'B':
                    //Just Stop
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Straight Gear
                    setServoAngle(0,90);
                    OC4R = power;
                    OC5R = power;
                    setMotorControl(0,MOTOR_BACKWARD);
                    //LED OFF
                    LATBbits.LATB2 = 0;
                    LATBbits.LATB15 = 0;
                    //RecvData[0] = 'R';
                    break;
                case 'S':
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Straight Gear
                    //setServoAngle(0,160);
                    //LED OFF
                    LATBbits.LATB2 = 1;
                    LATBbits.LATB15 = 1;
                    //RecvData[0] = 'R';
                    break;
                case 'R':
                    //Just Stop
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Rotation Gear
                    setServoAngle(0,10);
                    OC4R = power;
                    OC5R = power;
                    setMotorControl(0,MOTOR_FORWARD);
                    //LED OFF
                    LATBbits.LATB2 = 1;
                    LATBbits.LATB15 = 1;
                    //RecvData[0] = 'R';
                    break;
                case 'L':
                    //Just Stop
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Rotation Gear
                    setServoAngle(0,10);
                    OC4R = power;
                    OC5R = power;
                    setMotorControl(0,MOTOR_BACKWARD);
                    //LED OFF
                    LATBbits.LATB2 = 0;
                    LATBbits.LATB15 = 0;
                    //RecvData[0] = 'R';
                    break;
                case 'Q':
                    OC4R = 0;
                    OC5R = 0;
                    setMotorControl(0,MOTOR_STOP);
                    //Straight Gear
                    setServoAngle(0,160);
                    //LED OFF
                    LATBbits.LATB2 = 0;
                    LATBbits.LATB15 = 0;
                    //RecvData[0] = 'R';
                    ADB_delConnection(AdbC);
                    DelayMs(250);
                    ClrWdt();
                    Sleep();
                    //while(true);
                    break;
                case 'C':
                    ConnectFlg = true;
                    break;
                default:
                    RecvData[0] = 'E';
                    break;
            }
            ADB_write(AdbC, 1,RecvData);
            AdbDataReceiveFlg = false;
        
            if(ConnectFlg==true){
                ADB_delConnection(AdbC);
                DelayMs(250);
                //ReConnection
                AdbC = tcpForward("60101");
                AdbDataReceiveFlg = false;
                ConnectFlg = false;
            }
        }
        DelayMs(1);
    }
    return 0;
}

void adbEventHandler(Connection * connection, adb_eventType event, uint16_t length, uint8_t * data)
{
int i;
/*
	ADB_CONNECT = 0,
	ADB_DISCONNECT,
	ADB_CONNECTION_OPEN,
	ADB_CONNECTION_CLOSE,
	ADB_CONNECTION_FAILED,
	ADB_CONNECTION_RECEIVE
 */
    switch(event){
    case ADB_CONNECTION_RECEIVE:
        tprintf("adbEventHandler : ADB_CONNECTION_RECEIVE len=%d\r\n",length);
        //for( i=0; i<length; i++){   RecvData[i] = data[i];  }
        memcpy( RecvData, data, length*sizeof(uint8_t));
        AdbDataReceiveFlg = true;
	break;
    case ADB_CONNECTION_OPEN:
        tprintf("adbEventHandler : ADB_CONNECTION_OPEN\r\n");
	AdbDataReceiveFlg = true;
        break;
    case ADB_CONNECTION_FAILED:
        tprintf("adbEventHandler : ADB_CONNECTION_FAILED\r\n");
	break;
    case ADB_CONNECTION_CLOSE:
        tprintf("adbEventHandler : ADB_CONNECTION_CLOSE\r\n");
	if(applicationLaunchState == true){
            applicationLaunched = true;
            applicationLaunchState = false;
	}
	break;
    default:
        tprintf("[%s] event_id=%d\r\n",__func__,(int)event);
        break;
    }
}

void lprint(char* str, int len) {
    char* buff;
    buff = malloc(len + 1);
    if (buff == NULL) {
        tprintf("insufficient memory area\r\n");
        return;
    }
    memcpy(buff, str, len);
    *(buff + len) = 0x00;
    tprintf("\x1b[31m%s\x1b[m", buff);
    free(buff);
}

void uart2_puts(char* str) {
    UART2PrintString(str);
}

void initPeripheral(void) {
#define ServoScycle     30000-1
#define Angle_PlusMAX2  5000
#define Angle_SP        3000-1
#define Angle_MinusMAX  2000-1
#define Angle_PlusMAX   4000-1

    TRISA = 0x00;
    TRISB = 0x00;

    TRISBbits.TRISB13 = 0;
    TRISBbits.TRISB14 = 0;
    //TRISBbits.TRISB15 = 0;

    RPOR6bits.RP13R = 18; // OC1
    RPOR7bits.RP14R = 19; // OC2
    //RPOR7bits.RP15R = 20; // OC3

    T2CON = 0;
    T2CONbits.TCKPS = 0x01; // プリスケーラ値 = 1/8。
    T2CONbits.TON = 1;

    PR2 = Angle_PlusMAX2; // PlusMAX2 = 5000 => 2.5ms
    IFS0bits.T2IF = 0;

    // タイマ２のゼロクリアを待つ。
    while (!IFS0bits.T2IF);
    // セットされたT2IFのクリア。
    IFS0bits.T2IF = 0;
    
    // ここからがOC1のイニシアライズ。
    OC1CON1 = 0;
    OC1CON2 = 0;
    // 同期要因をOCモジュール自身にする。PWM出力モードではこの設定が必要。
    OC1CON2bits.SYNCSEL = 0x1f;
    // デューティ値をセットして、パルス幅を1.5ms（サーボの原点位置のパルス幅）
    // にする。サーボへ送るパルス幅の指定はOCxRレジスタへの値のセットでおこなう。
    OC1R = Angle_SP;
    // PWM周期の値をセットして、PWMの周期を15ms周期にする。
    OC1RS = ServoScycle;
    // 入力クロック源をタイマ２にする。
    OC1CON1bits.OCTSEL = 0x00;
    // モードをエッジ整列PWM出力モードにする。OC1のスタート。
    OC1CON1bits.OCM = 0x06;

    // 2.5ms待つ。
    while (!IFS0bits.T2IF);
    IFS0bits.T2IF = 0;
    // OC2のイニシアライズ。
    OC2CON1 = 0;
    OC2CON2 = 0;
    OC2CON2bits.SYNCSEL = 0x1f;
    // パルス幅を1.0ms（ -60°）にする。
    OC2R = Angle_MinusMAX;
    OC2RS = ServoScycle;
    OC2CON1bits.OCTSEL = 0x00;
    OC2CON1bits.OCM = 0x06;

    // 2.5ms待つ。
    while (!IFS0bits.T2IF);
    IFS0bits.T2IF = 0;
/*
    // OC3のイニシアライズ。
    OC3CON1 = 0;
    OC3CON2 = 0;
    OC3CON2bits.SYNCSEL = 0x1f;
    // パルス幅を2.0ms（ +60°）にする。
    OC3R = Angle_PlusMAX;
    OC3RS = ServoScycle;
    OC3CON1bits.OCTSEL = 0x00;
    OC3CON1bits.OCM = 0x06;
*/

#if 1 // PWM for DC Motor
    TRISBbits.TRISB3 = 0;   //PORT B3 -> OUTPUT
    TRISBbits.TRISB4 = 0;   //PORT B4 -> OUTPUT

    RPOR1bits.RP3R = 21;    //PORT RP3 -> OC4
    RPOR2bits.RP4R = 22;    //PORT RP4 -> OC5

    // Setup Timer 1
    IFS0bits.T1IF = 0;          //Interrupt Flag Status 0(Timer3 Timer2) Clear==0
    T1CON = 0;                  //Timer 1 CONtrol registerの初期化
    T1CONbits.TCKPS = 0x02;     //64分周
    T1CONbits.TON = 1;          //Timer ON 0:OFF, 1:ON

    OC4R = 0;
    OC4RS = 128;

    OC5R = 0;
    OC5RS = 128;

    OC4CON1bits.OCTSEL = 0x04; // Timer 1
    OC5CON1bits.OCTSEL = 0x04; // Timer 1

    OC4CON2bits.SYNCSEL = 0x1f;
    OC5CON2bits.SYNCSEL = 0x1f;

    OC4CON1bits.OCM = 0x06; // CENTER ALIGNED PWM MODE
    OC5CON1bits.OCM = 0x06; // CENTER ALIGNED PWM MODE

#endif

}

static void setServoAngle(int ServoNo, int Angle) {

    // need to check the period of HIGH state not to break servo motor
    if (ServoNo == 0) {
        //		OC1R = 1275 + Angle * 2;
        OC1R = 1275 + Angle * 20;
        OC1RS = 30000 - 1;
        OC1CON1bits.OCTSEL = 0x00;
        OC1CON1bits.OCM = 0x06;
    } else {
        OC2R = 1275 + Angle * 20;
        OC2RS = 30000 - 1;
        OC2CON1bits.OCTSEL = 0x00;
        OC2CON1bits.OCM = 0x06;
    }
}

//OC4R = (unsigned char)power[0];
//OC5R = (unsigned char)power[1];

void setMotorControl(int motor, MotorControl cnt) {
    int p1, p2;

    TRISA = 0x00;
    TRISB = 0x00;
    UART2PrintString("setMotorControl:");

    switch (cnt) {
        case MOTOR_FORWARD:
            UART2PrintString("MOTOR FORWARD:");
            p1 = 1;
            p2 = 0;
            break;
        case MOTOR_BACKWARD:
            UART2PrintString("MOTOR BACKWARD:");
            p1 = 0;
            p2 = 1;
            break;
        case MOTOR_BRAKE:
            UART2PrintString("MOTOR BRAKE:");
            p1 = 1;
            p2 = 1;
            break;
        case MOTOR_STOP:
        default:
            UART2PrintString("MOTOR STOP:");
            p1 = 0;
            p2 = 0;
            break;
    }

    if (motor == 0) {
        UART2PrintString("0\r\n");
        LATAbits.LATA3 = p1;
        LATAbits.LATA2 = p2;
    } else {
        UART2PrintString("1\r\n");
        LATBbits.LATB5 = p1;
        LATAbits.LATA4 = p2;
    }
    
}
