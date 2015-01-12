/**
 * fn_isSelectMenuOpen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_IDC 		260
#define NUMBER_OF_IC	9

private ["_deviceName","_display"];
_deviceName = _this select 0;
_display = uiNamespace getvariable _deviceName;


(((ctrlPosition (_display displayCtrl START_IDC)) select 2) != 0)