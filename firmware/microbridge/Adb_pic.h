/*
	Copyright 2011 Niels Brouwers

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	   http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.#include <string.h>
*/

#ifndef __adb_h__
#define __adb_h__

typedef	unsigned char	uint8_t;
typedef unsigned short	uint16_t;
typedef	unsigned long	uint32_t;
typedef int				boolean;
typedef void*			adb_eventHandler;

#define true			1
#define false			0


#define MAX_PAYLOAD 4096;
#define USB_NAK_LIMIT       32000


#define A_SYNC 0x434e5953
#define A_CNXN 0x4e584e43
#define A_OPEN 0x4e45504f
#define A_OKAY 0x59414b4f
#define A_CLSE 0x45534c43
#define A_WRTE 0x45545257

#define ADB_CLASS 0xff
#define ADB_SUBCLASS 0x42
#define ADB_PROTOCOL 0x1

#define ADB_USB_PACKETSIZE 0x40
#define ADB_CONNECTION_RETRY_TIME 1000


typedef struct
{
	uint8_t address;
	uint8_t configuration;
	uint8_t interface;
	uint8_t inputEndPointAddress;
	uint8_t outputEndPointAddress;
} adb_usbConfiguration;

typedef struct
{
	// Command identifier constant
	uint32_t command;

	// First argument
	uint32_t arg0;

	// Second argument
	uint32_t arg1;

	// Payload length (0 is allowed)
	uint32_t data_length;

	// Checksum of data payload
	uint32_t data_check;

	// Command ^ 0xffffffff
	uint32_t magic;

} adb_message;

typedef enum
{
	ADB_UNUSED = 0,
	ADB_CLOSED,
	ADB_OPEN,
	ADB_OPENING,
	ADB_RECEIVING,
	ADB_WRITING
} ConnectionStatus;

typedef enum
{
	ADB_CONNECT = 0,
	ADB_DISCONNECT,
	ADB_CONNECTION_OPEN,
	ADB_CONNECTION_CLOSE,
	ADB_CONNECTION_FAILED,
	ADB_CONNECTION_RECEIVE
} adb_eventType;

typedef struct sConnection {
	char * connectionString;
	uint32_t localID, remoteID;
	uint32_t lastConnectionAttempt;
	uint16_t dataSize, dataRead;
	ConnectionStatus status;
	boolean reconnect;
	//yishii adb_eventHandler * eventHandler;
	struct sConnection * next;

#if 0
	int write(uint16_t length, uint8_t * data);
	int writeString(char * str);
	bool isOpen();
#endif
} Connection;

int ADB_write(Connection * , uint16_t , uint8_t *);



#if 0 //  yishii
typedef struct {


} adb_eventHandler;
#endif







int ADB_init();
void ADB_poll();
Connection * ADB_addConnection(const char * connectionString,boolean reconnect);
void ADB_delConnection(Connection* c);


#if 0

#include "wiring.h"
#include <usb.h>
#include <ch9.h>

typedef void(usb_eventHandler)(usb_device * device, usb_eventType event);



class Connection;

// Event handler
typedef void(adb_eventHandler)(Connection * connection, adb_eventType event, uint16_t length, uint8_t * data);


class ADB
{

private:
	static void fireEvent(Connection * connection, adb_eventType type, uint16_t length, uint8_t * data);
	static int writeEmptyMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1);
	static int writeMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1, uint32_t length, uint8_t * data);
	static int writeStringMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1, char * str);
	static boolean pollMessage(adb_message * message, boolean poll);
	static void openClosedConnections();
	static void handleOkay(Connection * connection, adb_message * message);
	static void handleClose(Connection * connection);
	static void handleWrite(Connection * connection, adb_message * message);
	static void handleConnect(adb_message * message);
	static boolean isAdbInterface(usb_interfaceDescriptor * interface);

public:
	static void init();
	static void poll();

	static void setEventHandler(adb_eventHandler * handler);
	static Connection * addConnection(const char * connectionString, boolean reconnect, adb_eventHandler * eventHandler);
	static int write(Connection * connection, uint16_t length, uint8_t * data);
	static int writeString(Connection * connection, char * str);

	static boolean isAdbDevice(usb_device * device, int configuration, adb_usbConfiguration * handle);
	static void initUsb(usb_device * device, adb_usbConfiguration * handle);
	static void closeAll();
};

#endif

#endif

