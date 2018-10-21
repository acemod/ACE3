#include "script_component.hpp"
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
 * [medical_menu] call ace_medical_menu_fnc_onMenuOpen
 *
 * Public: No
 */
#define MAX_DISTANCE 10

params ["_display"];

if (isNil "_display") exitWith {};

if (EGVAR(interact_menu,menuBackground)==1) then {[QGVAR(id), true] call EFUNC(common,blurScreen);};
if (EGVAR(interact_menu,menuBackground)==2) then {0 cutRsc[QEGVAR(interact_menu,menuBackground), "PLAIN", 1, false];};

if (isNil QGVAR(LatestDisplayOptionMenu)) then {
    GVAR(LatestDisplayOptionMenu) = "triage";
} else {
    if (GVAR(LatestDisplayOptionMenu) == "toggle") then {
        GVAR(LatestDisplayOptionMenu) = "triage";
        GVAR(INTERACTION_TARGET) = GVAR(INTERACTION_TARGET_PREVIOUS);
    };
};

private _target = GVAR(INTERACTION_TARGET);
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

if (GVAR(MenuPFHID) != -1) exitWith {ERROR("PFID already running");};

GVAR(MenuPFHID) = [{

    (_this select 0) params ["_display"];
    if (isNull GVAR(INTERACTION_TARGET)) then {
        GVAR(INTERACTION_TARGET) = ACE_player;
    };
    [GVAR(INTERACTION_TARGET), _display] call FUNC(updateUIInfo);
    [GVAR(INTERACTION_TARGET)] call FUNC(updateIcons);
    [GVAR(LatestDisplayOptionMenu)] call FUNC(handleUI_DisplayOptions);

    //Check that it's valid to stay open:
    if !(([ACE_player, GVAR(INTERACTION_TARGET), ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call FUNC(canOpenMenu)}) then {
        closeDialog 314412;
        //If we failed because of distance check, show UI message:
        if ((ACE_player distance GVAR(INTERACTION_TARGET)) > GVAR(maxRange)) then {
            [[ELSTRING(medical,DistanceToFar), [GVAR(INTERACTION_TARGET)] call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);
        };
    };

}, 0, [_display]] call CBA_fnc_addPerFrameHandler;

["ace_medicalMenuOpened", [ACE_player, _target]] call CBA_fnc_localEvent;
