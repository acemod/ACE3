#include "script_component.hpp"
/*
 * Author: commy2
 * Make the player climb over short walls.
 *
 * Arguments:
 * 0: The Unit (usually the player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_movement_fnc_climb
 *
 * Public: No
 */

params ["_unit"];

if !([_unit] call FUNC(canClimb)) exitWith {
    [localize LSTRING(CanNotClimb)] call EFUNC(common,displayTextStructured);
};

if !(_unit getVariable [QGVAR(isClimbInit), false]) then {
    _unit addEventHandler ["AnimChanged", {
        if (local (_this select 0) && {_this select 1 == "ACE_Climb"}) then {
            // abort climb animation
            if !(_this call FUNC(canClimb)) then {
                [_this select 0, "AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
            };
        };
    }];

    _unit addEventHandler ["AnimDone", {
        if (local (_this select 0) && {_this select 1 == "ACE_Climb"}) then {_this call FUNC(handleClimb)};
    }];

    _unit setVariable [QGVAR(isClimbInit), true];
};

[_unit] call EFUNC(common,fixLoweredRifleAnimation);
[_unit, "AmovPercMstpSnonWnonDnon", 0] call EFUNC(common,doAnimation);
[_unit, "ACE_Climb", 0] call EFUNC(common,doAnimation);
