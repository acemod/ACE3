#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(MenuPFHID) = -1;
GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

["ace_treatmentSucceded", {
    if (GVAR(openAfterTreatment) && {GVAR(pendingReopen)}) then {
        GVAR(pendingReopen) = false;
        [{
            [GVAR(INTERACTION_TARGET)] call FUNC(openMenu);
        }, []] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;

["ACE3 Common", QGVAR(displayMenuKeyPressed), localize LSTRING(DisplayMenuKey),
{
    private _target = cursorTarget;
    if (!((_target isKindOf "CAManBase") && {[ACE_player, _target] call FUNC(canOpenMenu)})) then {_target = ACE_player};

    // Conditions: canInteract
    if !([ACE_player, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, _target] call FUNC(canOpenMenu)) exitWith {false};

    // Statement
    [_target] call FUNC(openMenu);
    false
},
{
    if (CBA_missionTime - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
    false
},
[35, [false, false, false]], false, 0] call CBA_fnc_addKeybind;
