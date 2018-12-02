#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(target) = objNull;
GVAR(previousTarget) = objNull;
GVAR(selectedBodyPart) = 0;
GVAR(latestCategory) = "triage";

GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

GVAR(menuPFH) = -1;

[] call FUNC(addTreatmentActions);
[] call FUNC(collectActions);

["ace_treatmentSucceded", {
    if (GVAR(openAfterTreatment) && {GVAR(pendingReopen)}) then {
        GVAR(pendingReopen) = false;
        [{
            [GVAR(INTERACTION_TARGET)] call FUNC(openMenu);
        }, []] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;

["ACE3 Common", QGVAR(openMedicalMenuKey), localize LSTRING(DisplayMenuKey),
{
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
},
{
    // Close menu if enough time passed from opening
    if (CBA_missionTime - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
    false
},
[35, [false, false, false]], false, 0] call CBA_fnc_addKeybind;


// Close patient information when interact menu is closed
["ace_interactMenuClosed", {[objNull, 0] call FUNC(displayPatientInformation);}] call CBA_fnc_addEventHandler;
