#define I_CLOSED isNil QGVAR(ifOpen)

#define I_GET_DEVICE (GVAR(ifOpen) select 0)
#define I_GET_TYPE (GVAR(ifOpen) select 1)
#define I_GET_NAME (GVAR(ifOpen) select 2)
#define I_GET_DISPLAY (uiNamespace getVariable I_GET_NAME)