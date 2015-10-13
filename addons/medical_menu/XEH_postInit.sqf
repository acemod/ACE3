#include "script_component.hpp"

if (!hasInterface) exitwith {};

GVAR(MenuPFHID) = -1;
GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

["medical_treatmentSuccess", {

    if (GVAR(openAfterTreatment) && {GVAR(pendingReopen)}) then {
        GVAR(pendingReopen) = false;
        [{
            [GVAR(INTERACTION_TARGET)] call FUNC(openMenu);
        }, []] call EFUNC(common,execNextFrame);
    };
}] call EFUNC(common,addEventhandler);


["ACE3 Common", QGVAR(displayMenuKeyPressed), localize LSTRING(DisplayMenuKey),
{
    local _target = cursorTarget;
    if (!((_target isKindOf "CAManBase") && {[ACE_player, _target] call FUNC(canOpenMenu)})) then {_target = ACE_player};

    // Conditions: canInteract
    if !([ACE_player, _target, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, _target] call FUNC(canOpenMenu)) exitwith {false};

    // Statement
    [_target] call FUNC(openMenu);
    false
},
{
    if (ACE_time - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
    false
},
[35, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

