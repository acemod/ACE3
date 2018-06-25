#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, commy2
 * Checks for nearby running helicopters (within 15m)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radius to check for helicopter (default: 15) <NUMBER>
 *
 * Return Value:
 * Array <ARRAY>:
 *     0: In rotorwash <BOOL>
 *     1: Amount of rotor wash. <NUMBER>
 *
 * Example:
 * if ([ace_player, 10] call ace_goggles_fnc_isInRotorWash select 0) then { hint "Rotor wash"; };
 * if ([ace_player] call ace_goggles_fnc_isInRotorWash select 0) then { hint "Rotor wash"; };
 *
 * Public: Yes
 */

params ["_unit", ["_radius", 15]];

private _rotorWash = [false, 0];

{
    if (isEngineOn _x) then {
        private _distance = _unit distance _x;

        // convert distance to 0...1 range, where 0 is the maximum radius
        _distance = 1 - _distance / _radius;

        // use highest amount of rotor wash as return value in case of multiple helicopters
        if (_distance > _rotorWash select 1) then {
            _rotorWash set [0, true];
            _rotorWash set [1, _distance];
        };
    };
    false
} count (position _unit nearEntities [["Helicopter"], _radius]);

_rotorWash
