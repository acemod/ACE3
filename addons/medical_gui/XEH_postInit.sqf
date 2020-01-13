#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(target) = objNull;
GVAR(previousTarget) = objNull;
GVAR(selectedBodyPart) = 0;
GVAR(selectedCategory) = "triage";

GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

GVAR(menuPFH) = -1;

GVAR(selfInteractionActions) = [];
[] call FUNC(addTreatmentActions);
[] call FUNC(collectActions);

[QEGVAR(interact_menu,newControllableObject), {
    params ["_type"]; // string of the object's classname
    if (!(_type isKindOf "CAManBase")) exitWith {};
    {
        _x set [0, _type];
        _x call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(selfInteractionActions);
}] call CBA_fnc_addEventHandler;

["ace_treatmentSucceded", {
    if (GVAR(openAfterTreatment) && {GVAR(pendingReopen)}) then {
        GVAR(pendingReopen) = false;
        [FUNC(openMenu), GVAR(target)] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;

["ACE3 Common", QGVAR(openMedicalMenuKey), localize LSTRING(OpenMedicalMenu), {
    // Get target (cursorTarget and cursorObject), if not valid then target is ACE_player
    TRACE_3("Open menu key",cursorTarget,cursorObject,ACE_player);
    private _target = cursorTarget;
    if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
        _target = cursorObject;
        if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
            _target = ACE_player;
        };
    };

    // Check conditions: canInteract and canOpenMenu
    if !([ACE_player, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, _target] call FUNC(canOpenMenu)) exitWith {false};

    // Statement
    [_target] call FUNC(openMenu);
    false
}, {
    // Close menu if enough time passed from opening
    if (CBA_missionTime - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
    false
}, [DIK_H, [false, false, false]], false, 0] call CBA_fnc_addKeybind;


// Close patient information display when interaction menu is closed
["ace_interactMenuClosed", {
    QGVAR(RscPatientInfo) cutFadeOut 0.3;
}] call CBA_fnc_addEventHandler;
