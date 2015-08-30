/*
 * Author: Glowbal
 * Handle medical menu opened
 *
 * Arguments:
 * 0: Medical Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [medical_menu] call ace_medical_menu_onMenuOpen
 *
 * Public: No
 */
#include "script_component.hpp"
#define MAX_DISTANCE 10

private "_target";

params ["_display"];

if (isNil "_display") exitwith {};

if (isNil QGVAR(LatestDisplayOptionMenu)) then {
    GVAR(LatestDisplayOptionMenu) = "triage";
} else {
    if (GVAR(LatestDisplayOptionMenu) == "toggle") then {
        GVAR(LatestDisplayOptionMenu) = "triage";
        GVAR(INTERACTION_TARGET) = GVAR(INTERACTION_TARGET_PREVIOUS);
    };
};

_target = GVAR(INTERACTION_TARGET);
if (isNil QGVAR(INTERACTION_TARGET_PREVIOUS)) then {
    GVAR(INTERACTION_TARGET_PREVIOUS) = _target;
};
[GVAR(LatestDisplayOptionMenu)] call FUNC(handleUI_DisplayOptions);

disableSerialization;

[_target, _display] call FUNC(updateUIInfo);

(_display displayCtrl 11) ctrlSetTooltip localize LSTRING(VIEW_TRIAGE_CARD);
(_display displayCtrl 12) ctrlSetTooltip localize LSTRING(EXAMINE_PATIENT);
(_display displayCtrl 13) ctrlSetTooltip localize LSTRING(BANDAGE_FRACTURES);
(_display displayCtrl 14) ctrlSetTooltip localize LSTRING(MEDICATION);
(_display displayCtrl 15) ctrlSetTooltip localize LSTRING(AIRWAY_MANAGEMENT);
(_display displayCtrl 16) ctrlSetTooltip localize LSTRING(ADVANCED_TREATMENT);
(_display displayCtrl 17) ctrlSetTooltip localize LSTRING(DRAG_CARRY);
(_display displayCtrl 18) ctrlSetTooltip localize LSTRING(TOGGLE_SELF);

(_display displayCtrl 301) ctrlSetTooltip localize LSTRING(SELECT_HEAD);
(_display displayCtrl 302) ctrlSetTooltip localize LSTRING(SELECT_TORSO);
(_display displayCtrl 303) ctrlSetTooltip localize LSTRING(SELECT_ARM_R);
(_display displayCtrl 304) ctrlSetTooltip localize LSTRING(SELECT_ARM_L);
(_display displayCtrl 305) ctrlSetTooltip localize LSTRING(SELECT_LEG_R);
(_display displayCtrl 306) ctrlSetTooltip localize LSTRING(SELECT_LEG_L);
(_display displayCtrl 2001) ctrlSetTooltip localize LSTRING(SELECT_TRIAGE_STATUS);

(_display displayCtrl 1) ctrlSetText format ["%1", [_target] call EFUNC(common,getName)];
setMousePosition [0.4, 0.4];

GVAR(MenuPFHID) = [{

    (_this select 0) params ["_display"];
    if (isNull GVAR(INTERACTION_TARGET)) then {
        GVAR(INTERACTION_TARGET) = ACE_player;
    };
    [GVAR(INTERACTION_TARGET), _display] call FUNC(updateUIInfo);
    [GVAR(INTERACTION_TARGET)] call FUNC(updateIcons);
    [GVAR(LatestDisplayOptionMenu)] call FUNC(handleUI_DisplayOptions);

    _status = [GVAR(INTERACTION_TARGET)] call FUNC(getTriageStatus);
    (_display displayCtrl 2000) ctrlSetText (_status select 0);
    (_display displayCtrl 2000) ctrlSetBackgroundColor (_status select 2);

    if (ACE_player distance _target > MAX_DISTANCE) exitwith {
        closeDialog 314412;
        ["displayTextStructured", [ACE_player], [[ELSTRING(medical,DistanceToFar), [_target] call EFUNC(common,getName)], 1.75, ACE_player]] call EFUNC(common,targetEvent);
    };

}, 0, [_display]] call CBA_fnc_addPerFrameHandler;

 ["Medical_onMenuOpen", [ACE_player, _interactionTarget]] call EFUNC(common,localEvent);
