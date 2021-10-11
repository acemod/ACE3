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
    // Get target (cursorTarget, cursorObject, and lineIntersectsSurfaces along camera to maxDistance), if not valid then target is ACE_player
    TRACE_3("Open menu key",cursorTarget,cursorObject,ACE_player);
    private _target = cursorTarget;
    if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
        _target = cursorObject;
        if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
            private _start = AGLToASL positionCameraToWorld [0, 0, 0];
            private _end = AGLToASL positionCameraToWorld [0, 0, GVAR(maxDistance)];
            private _intersections = lineIntersectsSurfaces [_start, _end, ACE_player, objNull, true, -1, "FIRE"];
            {
                _x params ["", "", "_intersectObject"];
                // Only look "through" player and player's vehicle
                if (!(_intersectObject isKindOf "CAManBase") && {_intersectObject != vehicle ACE_player}) exitWith {};
                if (_intersectObject != ACE_player && {_intersectObject isKindOf "CAManBase" && {[ACE_player, _intersectObject] call FUNC(canOpenMenu)}}) exitWith {
                    _target =_intersectObject
                };
            } forEach _intersections;
            if (!(_target isKindOf "CAManBase") || {!([ACE_player, _target] call FUNC(canOpenMenu))}) then {
                _target = ACE_player;
            };
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
