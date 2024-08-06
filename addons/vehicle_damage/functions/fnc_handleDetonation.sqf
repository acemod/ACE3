#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Checks hitpoint damage and determines if a vehicle should detonate its ammo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Chance of detonation <NUMBER>
 * 2: If the crew should be injured <BOOL>
 * 3: Source of damage <OBJECT>
 * 4: Person who caused damage <OBJECT>
 * 5: If the crew's death should be guaranteed <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 0.5, true, player, player] call ace_vehicle_damage_fnc_handleDetonation
 *
 * Public: No
 */

params ["_vehicle", "_chanceOfDetonation", "_injureCrew", "_source", "_instigator", ["_guaranteeDeath", false]];
TRACE_6("handleDetonation",_vehicle,_chanceOfDetonation,_injureCrew,_source,_instigator,_guaranteeDeath);

private _isDetonating = _vehicle getVariable [QEGVAR(cookoff,isAmmoDetonating), false];

// Ignore if the vehicle is already detonating ammo
if (!_guaranteeDeath && {_isDetonating || {random 1 > _chanceOfDetonation}}) exitWith {
    TRACE_2("no detonation",_vehicle,_chanceOfDetonation);
};

// Injure the crew
if (_injureCrew || _guaranteeDeath) then {
    {
        [QGVAR(medicalDamage), [_x, _source, _instigator, _guaranteeDeath], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
};

if (_isDetonating) exitWith {};

// Detonate the vehicle
[QEGVAR(cookoff,detonateAmmunitionServer), [_vehicle, false, _source, _instigator]] call CBA_fnc_serverEvent;

TRACE_2("detonation",_vehicle,_chanceOfDetonation);
