/**
 * fn_setBackground_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl","_newBackGround"];
_deviceName = _this select 0;
_pos = _this select 1;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;


disableSerialization;
_display = uiNamespace getvariable _deviceName;
_ctrl = (_display displayCtrl 1);

_newPos = switch (_pos) do {
	case "full": {_settings};
	case "hidden": {[0,0,0,0]};
};

_newBackGround = "cse\cse_sys_cc\data\empty_background2.paa";
if (count _this > 2) then {
	_newBackGround = switch (_this select 2) do {
		case "black": {"cse\cse_sys_cc\data\black_background.paa"};
		default {"cse\cse_sys_cc\data\empty_background2.paa"};
	};
};

_ctrl ctrlSetText _newBackGround;
_ctrl ctrlsetPosition _newPos;
_ctrl ctrlCommit 0;
