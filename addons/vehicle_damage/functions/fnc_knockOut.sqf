#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Knock out vehicle from battle. Destroy all internal hitpoints.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_vehicle_damage_fnc_knockOut
 *
 * Public: No
 */

params ["_vehicle"];

{
    private _hitArea = _y select 0;

    if (_hitArea == "hull") then {
        [_vehicle, -1, _x, 0.89] call FUNC(addDamage);
    } else {
        if (_hitArea in ["fuel", "turret", "gun", "engine"]) then {
            if ((0.3 > random 1) || {_hitArea == "engine"}) then {
                [_vehicle, -1, _x, 1] call FUNC(addDamage);
            } else {
                private _currentDamage = _vehicle getHitpointDamage _x;
                [_vehicle, -1, _x, (_currentDamage + (0.3 max random 1)) min 1] call FUNC(addDamage);
            };
        };
    };
} forEach (_vehicle getVariable [QGVAR(hitPointHash), createHashMap]);
