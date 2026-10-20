#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Knock out a vehicle from battle by destroying all internal hitpoints.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Source of damage <OBJECT>
 * 2: Person who caused damage <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, player] call ace_vehicle_damage_fnc_knockOut
 *
 * Public: No
 */

params ["_vehicle", "_source", "_instigator"];
TRACE_3("knockOut",_vehicle,_source,_instigator);

{
    private _hitArea = _y select 0;

    if (_hitArea == "hull") then {
        [_vehicle, _x, -1, 0.89, _source, _instigator] call FUNC(setDamage);
    } else {
        if (_hitArea in ["fuel", "turret", "gun", "engine"]) then {
            if ((0.3 > random 1) || {_hitArea == "engine"}) then {
                [_vehicle, _x, -1, 1, _source, _instigator] call FUNC(setDamage);
            } else {
                [_vehicle, _x, -1, ((_vehicle getHitPointDamage _x) + (0.3 max random 1)) min 1, _source, _instigator] call FUNC(setDamage);
            };
        };
    };
} forEach (GVAR(vehicleClassesHitPointHash) getOrDefault [typeOf _vehicle, createHashMap]);
