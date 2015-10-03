#include "script_component.hpp"

if (!hasInterface) exitWith {};

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
    _target = cursorTarget;
    if (!(_target isKindOf "CAManBase") || ACE_player distance _target > 10) then {_target = ACE_player};
    // Conditions: canInteract
    if !([ACE_player, _target, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, _target] call FUNC(canOpenMenu)) exitWith {false};

    // Statement
    [_target] call FUNC(openMenu);
    false
},
{
    if (ACE_time - GVAR(lastOpenedOn) > 0.5) exitWith {
        [ObjNull] call FUNC(openMenu);
    };
    false
},
[35, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

