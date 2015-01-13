/**
 * fn_onMenuOpen_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isnil "CSE_LATEST_DISPLAY_OPTION_MENU_CMS") then {
	CSE_LATEST_DISPLAY_OPTION_MENU_CMS = "triage";
} else {
	if (CSE_LATEST_DISPLAY_OPTION_MENU_CMS == "toggle") then {
		CSE_LATEST_DISPLAY_OPTION_MENU_CMS = "triage";
		CSE_SYS_MEDICAL_INTERACTION_TARGET = CSE_SYS_MEDICAL_INTERACTION_TARGET_PREVIOUS;
	};
};

private ["_display","_target"];
_target = CSE_SYS_MEDICAL_INTERACTION_TARGET;
CSE_SYS_MEDICAL_INTERACTION_TARGET = _target;
if (isnil "CSE_SYS_MEDICAL_INTERACTION_TARGET_PREVIOUS") then {
	CSE_SYS_MEDICAL_INTERACTION_TARGET_PREVIOUS = _target;
};
[CSE_LATEST_DISPLAY_OPTION_MENU_CMS] call cse_fnc_displayOptions_CMS;

[] call cse_fnc_updateActivityLog_CMS;
[_target] call cse_fnc_updateUIInfo_CMS;

// 11 till 18
disableSerialization;
_display = uiNamespace getVariable 'cse_sys_medicalMenu';
(_display displayCtrl 11) ctrlSetTooltip localize "STR_CSE_UI_VIEW_TRIAGE_CARD";
(_display displayCtrl 12) ctrlSetTooltip localize "STR_CSE_UI_EXAMINE_PATIENT";
(_display displayCtrl 13) ctrlSetTooltip localize "STR_CSE_UI_BANDAGE_FRACTURES";
(_display displayCtrl 14) ctrlSetTooltip localize "STR_CSE_UI_MEDICATION";
(_display displayCtrl 15) ctrlSetTooltip localize "STR_CSE_UI_AIRWAY_MANAGEMENT";
(_display displayCtrl 16) ctrlSetTooltip localize "STR_CSE_UI_ADVANCED_TREATMENT";
(_display displayCtrl 17) ctrlSetTooltip localize "STR_CSE_UI_DRAG_CARRY";
(_display displayCtrl 18) ctrlSetTooltip localize "STR_CSE_UI_TOGGLE_SELF";

(_display displayCtrl 301) ctrlSetTooltip localize "STR_CSE_UI_SELECT_HEAD";
(_display displayCtrl 302) ctrlSetTooltip localize "STR_CSE_UI_SELECT_TORSO";
(_display displayCtrl 303) ctrlSetTooltip localize "STR_CSE_UI_SELECT_ARM_R";
(_display displayCtrl 304) ctrlSetTooltip localize "STR_CSE_UI_SELECT_ARM_L";
(_display displayCtrl 305) ctrlSetTooltip localize "STR_CSE_UI_SELECT_LEG_R";
(_display displayCtrl 306) ctrlSetTooltip localize "STR_CSE_UI_SELECT_LEG_L";
//if (_target != player) then {
	(_display displayCtrl 2001) ctrlSetTooltip localize "STR_CSE_UI_SELECT_TRIAGE_STATUS";
//};
(_display displayCtrl 1) ctrlSetText format["%1",[_target] call cse_fnc_getName];
setMousePosition [ 0.4, 0.4];

["cse_onMenuOpen_CMS", "onEachFrame", {
	_display = _this select 0;
	if (isNull CSE_SYS_MEDICAL_INTERACTION_TARGET) then {
		CSE_SYS_MEDICAL_INTERACTION_TARGET = player;
	};
	[CSE_SYS_MEDICAL_INTERACTION_TARGET] call cse_fnc_updateUIInfo_CMS;
	[] call cse_fnc_updateActivityLog_CMS;
	[CSE_LATEST_DISPLAY_OPTION_MENU_CMS] call cse_fnc_displayOptions_CMS;
	_status = [CSE_SYS_MEDICAL_INTERACTION_TARGET] call cse_fnc_getTriageStatus_CMS;
	(_display displayCtrl 2000) ctrlSetText (_status select 0);
	(_display displayCtrl 2000) ctrlSetBackgroundColor (_status select 2);

 }, [_display]] call BIS_fnc_addStackedEventHandler;