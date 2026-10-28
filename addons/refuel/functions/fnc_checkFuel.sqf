#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Get the remaining fuel amount
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_checkFuel
 *
 * Public: No
 */

params ["_unit", "_source"];

private _fuel = _source call FUNC(getFuel);

[
    GVAR(progressDuration) * 2,
    [_unit, _source, _fuel],
    {
        (_this select 0) params ["_unit", "", "_fuel"];

        if (_fuel > 0) then {
            [[LSTRING(hint_RemainingFuel), _fuel], 2, _unit] call EFUNC(common,displayTextStructured);
        } else {
            [LSTRING(hint_Empty), 2, _unit] call EFUNC(common,displayTextStructured);
        };
    },
    {},
    LLSTRING(checkFuelAction),
    {
        ((_this select 0) call EFUNC(interaction,getInteractionDistance)) <= REFUEL_ACTION_DISTANCE &&
        {(_this select 0) call FUNC(canCheckFuel)}
    },
    [INTERACT_EXCEPTIONS]
] call EFUNC(common,progressBar);
