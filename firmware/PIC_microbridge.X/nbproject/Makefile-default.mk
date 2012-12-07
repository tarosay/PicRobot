#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/221508487/uart2.o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ${OBJECTDIR}/_ext/343710134/usb_host.o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1664993608/tprintf.o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ${OBJECTDIR}/_ext/1472/usb_config.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/221508487/uart2.o.d ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d ${OBJECTDIR}/_ext/343710134/usb_host.o.d ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d ${OBJECTDIR}/_ext/1472/Delay.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/1664993608/tprintf.o.d ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d ${OBJECTDIR}/_ext/1472/usb_config.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/221508487/uart2.o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ${OBJECTDIR}/_ext/343710134/usb_host.o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1664993608/tprintf.o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ${OBJECTDIR}/_ext/1472/usb_config.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,-Tp24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/221508487/uart2.o: ../Microchip/Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.ok ${OBJECTDIR}/_ext/221508487/uart2.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/221508487/uart2.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/221508487/uart2.o.d" -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c  
	
${OBJECTDIR}/_ext/1463451266/Adb_pic.o: ../microbridge/Adb_pic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1463451266 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d" -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c  
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/343710134 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ${OBJECTDIR}/_ext/343710134/usb_host.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/343710134/usb_host.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/343710134/usb_host.o.d" -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c  
	
${OBJECTDIR}/_ext/1899306274/usb_host_generic.o: ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1899306274 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d" -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o "../Microchip/USB/Generic Host Driver/usb_host_generic.c"  
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.ok ${OBJECTDIR}/_ext/1472/Delay.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d" -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	
${OBJECTDIR}/_ext/1664993608/tprintf.o: ../tinymodules/tprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1664993608/tprintf.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1664993608/tprintf.o.d" -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c  
	
${OBJECTDIR}/_ext/1664993608/tsprintf.o: ../tinymodules/tsprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1664993608/tsprintf.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1664993608/tsprintf.o.d" -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c  
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d" -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	
else
${OBJECTDIR}/_ext/221508487/uart2.o: ../Microchip/Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.ok ${OBJECTDIR}/_ext/221508487/uart2.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/221508487/uart2.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/221508487/uart2.o.d" -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c  
	
${OBJECTDIR}/_ext/1463451266/Adb_pic.o: ../microbridge/Adb_pic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1463451266 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d" -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c  
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/343710134 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ${OBJECTDIR}/_ext/343710134/usb_host.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/343710134/usb_host.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/343710134/usb_host.o.d" -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c  
	
${OBJECTDIR}/_ext/1899306274/usb_host_generic.o: ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1899306274 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d" -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o "../Microchip/USB/Generic Host Driver/usb_host_generic.c"  
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.ok ${OBJECTDIR}/_ext/1472/Delay.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d" -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	
${OBJECTDIR}/_ext/1664993608/tprintf.o: ../tinymodules/tprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1664993608/tprintf.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1664993608/tprintf.o.d" -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c  
	
${OBJECTDIR}/_ext/1664993608/tsprintf.o: ../tinymodules/tsprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1664993608/tsprintf.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1664993608/tsprintf.o.d" -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c  
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d" -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=4096,--no-check-sections,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=4096,--no-check-sections,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -omf=elf
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
