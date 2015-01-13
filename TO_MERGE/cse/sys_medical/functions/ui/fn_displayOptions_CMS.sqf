/**
 * fn_displayOptions_CMS.sqf
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

private ["_name","_entries","_display","_newTarget","_counter","_card","_ctrl","_code"];
_name = _this select 0;
if (isDedicated) exitwith{};
_entries = switch (_name) do {
	case "advanced": {[_name] call cse_fnc_getAdvancedOptions_CMS};
	case "examine": {[_name] call cse_fnc_getExamineOptions_CMS};
	case "bandage": {[_name] call cse_fnc_getBandageOptions_CMS};
	case "medication": {[_name] call cse_fnc_getMedicationOptions_CMS};
	case "airway": {[_name] call cse_fnc_getAirwayOptions_CMS};
	case "triage": {[_name] call cse_fnc_getTriageCardOptions_CMS};
	case "drag": {[_name] call cse_fnc_getDragOptions_CMS};
	case "toggle": {[_name] call cse_fnc_getToggleOptions_CMS};
	default {[]};
};

disableSerialization;
_display = uiNamespace getVariable 'cse_sys_medicalMenu';
if ((_name == "toggle")) exitwith {

	if (CSE_SYS_MEDICAL_INTERACTION_TARGET != player) then {
		_newTarget = player;
	} else {
		_newTarget = CSE_SYS_MEDICAL_INTERACTION_TARGET_PREVIOUS;
	};

	CSE_SYS_MEDICAL_INTERACTION_TARGET_PREVIOUS = CSE_SYS_MEDICAL_INTERACTION_TARGET;
	[_newTarget] spawn {
		closeDialog 0;
		sleep 0.1;
		[_this select 0] call cse_fnc_openMenu_CMS;
	};
};

CSE_LATEST_DISPLAY_OPTION_MENU_CMS = _name;
lbClear 212;
if (_name == "triage") then {
	ctrlEnable[212,true];
	_card = ([CSE_SYS_MEDICAL_INTERACTION_TARGET] call cse_fnc_getTriageList_CMS);
	{
		lbadd[212,format["%1 x%2",getText(configFile >> "CfgMagazines" >> (_x select 0) >> "displayName"),_x select 1]];
	}foreach _card;
	if (count _card == 0) then {
		lbadd[212,"No Entries"];
	};
} else {
	ctrlEnable[212,false];
};


for [{_x=START_IDC},{_x <= END_IDC},{_x=_x+1}] do {
	_ctrl = (_display displayCtrl (_x));
	_ctrl ctrlSetText "";
	//_ctrl ctrlSetPosition[-100,-100];
	_ctrl ctrlShow false;
	_ctrl ctrlSetEventHandler ["ButtonClick",""];
	_ctrl ctrlSetTooltip "";
	_ctrl ctrlCommit 0;

};

{
	//player sidechat format["TRIGGERED: %1",_x];
	if (_foreachIndex > END_IDC) exitwith {};
	_ctrl = (_display displayCtrl (START_IDC + _foreachIndex));
	if (!(_foreachIndex > AMOUNT_OF_ENTRIES)) then {
 		_ctrl ctrlSetText (_x select 0);
 		_code = format["[CSE_SYS_MEDICAL_INTERACTION_TARGET,PLAYER] spawn { %1 };",(_x select 1),CSE_SYS_MEDICAL_INTERACTION_TARGET,player];
		_ctrl ctrlSetEventHandler ["ButtonClick", _code];
		_ctrl ctrlSetTooltip (_x select 2);
		_ctrl ctrlShow true;
	} else {
 		_ctrl ctrlSetText "";
		_ctrl ctrlSetEventHandler ["ButtonClick",""];
	};
	_ctrl ctrlCommit 0;
}foreach _entries;

[] call cse_fnc_updateIcons_CMS;