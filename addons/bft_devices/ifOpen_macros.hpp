// if interface is open <BOOL>
#define I_OPEN (!isNil 'GVAR(ifOpen)')
// if interface is closed <BOOL>
#define I_CLOSED (isNil 'GVAR(ifOpen)')

// device ID <STRING>
#define I_GET_DEVICE (GVAR(ifOpen) select 0)
// 0 = primary, 1 = secondary, 3 = tertiary <INTEGER>
#define I_GET_TYPE (GVAR(ifOpen) select 1)
// uiNamespace variable name of interface <STRING>
#define I_GET_NAME (GVAR(ifOpen) select 2)
// if interface is a dialog <BOOL>
#define I_GET_ISDIALOG (GVAR(ifOpen) select 3)
// display of interface <OBJECT>
#define I_GET_DISPLAY (uiNamespace getVariable I_GET_NAME)