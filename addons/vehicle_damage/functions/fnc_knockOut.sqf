#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Knock out vehicle from battle. Destroy all internal hitpoints.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_vehicle_damage_fnc_knockOut
 *
 * Public: No
 */

params ["_vehicle"];
private _hash = _vehicle getVariable [QGVAR(hitpointHash), nil];
if (isNil "_hash") exitWith {};

[_hash, {
    private _hitpointAlias = _value#0;
    if (_hitpointAlias isEqualTo "hull") then {
        [_vehicle, -1, _key, 0.89] call FUNC(addDamage);
    } else {
        if (_hitpointAlias in ["fuel", "turret", "gun", "engine"]) then {
            if ((0.3 > random 1) || { _hitpointAlias isEqualTo "engine" }) then {
                [_vehicle, -1, _key, 1] call FUNC(addDamage);
            } else {
                private _currentDamage = _vehicle getHitpointDamage _key;
                [_vehicle, -1, _key, (_currentDamage + (0.3 max random 1)) min 1] call FUNC(addDamage);
            };
        };
    };
}] call CBA_fnc_hashEachPair;

