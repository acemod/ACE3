/*
 * Author: Glowbal
 * Handle medical menu opened
 *
 * Arguments:
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */


#include "script_component.hpp"

if (isnil QGVAR(LatestDisplayOptionMenu)) then {
    GVAR(LatestDisplayOptionMenu) = "triage";
} else {
    if (GVAR(LatestDisplayOptionMenu) == "toggle") then {
        GVAR(LatestDisplayOptionMenu) = "triage";
        GVAR(INTERACTION_TARGET) = GVAR(INTERACTION_TARGET_PREVIOUS);
    };
};

private ["_display","_target"];
_target = GVAR(INTERACTION_TARGET);
if (isnil QGVAR(INTERACTION_TARGET_PREVIOUS)) then {
    GVAR(INTERACTION_TARGET_PREVIOUS) = _target;
};
[GVAR(LatestDisplayOptionMenu)] call FUNC(handleUI_DisplayOptions);


// 11 till 18
disableSerialization;
_display = _this select 0; //uiNamespace getVariable QGVAR(medicalMenu);
if (isnil "_display") exitwith {};
[_target, _display] call FUNC(updateUIInfo);

(_display displayCtrl 11) ctrlSetTooltip localize "STR_ACE_Medical_Menu_VIEW_TRIAGE_CARD";
(_display displayCtrl 12) ctrlSetTooltip localize "STR_ACE_Medical_Menu_EXAMINE_PATIENT";
(_display displayCtrl 13) ctrlSetTooltip localize "STR_ACE_Medical_Menu_BANDAGE_FRACTURES";
(_display displayCtrl 14) ctrlSetTooltip localize "STR_ACE_Medical_Menu_MEDICATION";
(_display displayCtrl 15) ctrlSetTooltip localize "STR_ACE_Medical_Menu_AIRWAY_MANAGEMENT";
(_display displayCtrl 16) ctrlSetTooltip localize "STR_ACE_Medical_Menu_ADVANCED_TREATMENT";
(_display displayCtrl 17) ctrlSetTooltip localize "STR_ACE_Medical_Menu_DRAG_CARRY";
(_display displayCtrl 18) ctrlSetTooltip localize "STR_ACE_Medical_Menu_TOGGLE_SELF";

(_display displayCtrl 301) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_HEAD";
(_display displayCtrl 302) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_TORSO";
(_display displayCtrl 303) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_ARM_R";
(_display displayCtrl 304) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_ARM_L";
(_display displayCtrl 305) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_LEG_R";
(_display displayCtrl 306) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_LEG_L";
(_display displayCtrl 2001) ctrlSetTooltip localize "STR_ACE_Medical_Menu_SELECT_TRIAGE_STATUS";

(_display displayCtrl 1) ctrlSetText format["%1",[_target] call EFUNC(common,getName)];
setMousePosition [ 0.4, 0.4];

[QGVAR(onMenuOpen), "onEachFrame", {
    if (isNull GVAR(INTERACTION_TARGET)) then {
        GVAR(INTERACTION_TARGET) = ACE_player;
    };
    [GVAR(INTERACTION_TARGET), _this select 0] call FUNC(updateUIInfo);
    [GVAR(INTERACTION_TARGET)] call FUNC(updateIcons);
    [GVAR(LatestDisplayOptionMenu)] call FUNC(handleUI_DisplayOptions);

    _status = [GVAR(INTERACTION_TARGET)] call FUNC(getTriageStatus);
    ((_this select 0) displayCtrl 2000) ctrlSetText (_status select 0);
    ((_this select 0) displayCtrl 2000) ctrlSetBackgroundColor (_status select 2);

 }, [_display]] call BIS_fnc_addStackedEventHandler;

 ["Medical_onMenuOpen", [ACE_player, _interactionTarget]] call ace_common_fnc_localEvent;
