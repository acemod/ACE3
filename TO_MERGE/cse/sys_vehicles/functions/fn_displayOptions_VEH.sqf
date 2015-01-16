/**
 * fn_displayOptions_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_IDC 			20
#define END_IDC 			27
#define AMOUNT_OF_ENTRIES 	(count _entries)

private ["_name","_display","_ctrl","_counter","_code"];

_name = _this select 0;
if (isDedicated) exitwith{};
_entries = switch (_name) do {
	case "crew": {[_name] call cse_fnc_getCrewOptions_VEH};
	case "cargo": {[_name] call cse_fnc_getCargoOptions_VEH};
	case "repair": {[_name] call cse_fnc_getRepairOptions_VEH};
	default {[]};
};
CSE_LATEST_DISPLAY_OPTION_MENU_VEH = _name;

disableSerialization;
_display = uiNamespace getVariable 'cse_sys_vehicleMenu';
for [{_x=START_IDC},{_x <= END_IDC},{_x=_x+1}] do {
	_ctrl = (_display displayCtrl (_x));
	_ctrl ctrlSetText "";
	//_ctrl ctrlSetPosition[-100,-100];
	_ctrl ctrlShow false;
	_ctrl ctrlSetEventHandler ["ButtonClick",""];
	_ctrl ctrlSetTooltip "";
	_ctrl ctrlCommit 0;
};

_counter = 0;
{
	//player sidechat format["TRIGGERED: %1",_x];
	if (_counter > END_IDC) exitwith {};
	_ctrl = (_display displayCtrl (START_IDC + _counter));
	if (!(_counter > AMOUNT_OF_ENTRIES)) then {
 		_ctrl ctrlSetText (_x select 0);
 		_code = format["[CSE_SYS_VEHICLE_INTERACTION_TARGET,PLAYER] call { %1 };",(_x select 1)];
		_ctrl ctrlSetEventHandler ["ButtonClick", _code];
		_ctrl ctrlSetTooltip (_x select 2);
		_ctrl ctrlShow true;
	} else {
 		_ctrl ctrlSetText "";
		_ctrl ctrlSetEventHandler ["ButtonClick",""];
	};
	_ctrl ctrlCommit 0;
	_counter = _counter + 1;
}foreach _entries;