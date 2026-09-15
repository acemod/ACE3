#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Checks hitpoint damage and determines if a vehicle should detonate its ammo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Chance of detonation <NUMBER>
 * 2: If the vehicle should be knocked out <BOOL>
 * 3: If the crew should be injured <BOOL>
 * 4: Source of damage <OBJECT>
 * 5: Person who caused damage <OBJECT>
 *
 * Return Value:
 * Should Detonate Ammo <BOOL>
 *
 * Example:
 * [cursorObject, 0.5, true, player, player] call ace_vehicle_damage_fnc_handleDetonation
 *
 * Public: No
 */

params ["_vehicle", "_chanceToDetonate", "_knockOut", "_injureCrew", "_source", "_instigator"];

// Ignore if the vehicle is already detonating ammo
if (_vehicle getVariable [QEGVAR(cookoff,isAmmoDetonating), false]) exitWith {
    TRACE_2("already detonating",_vehicle,_chanceToDetonate);

    if (_knockOut) then {
        [_vehicle, _source, _instigator] call FUNC(knockOut);
    };

    _knockOut // return
};

// Failure to detonate
if (_chanceToDetonate == 0 || {_chanceToDetonate < random 1}) exitWith {
    TRACE_2("no detonation",_vehicle,_chanceToDetonate);

    false // return
};

// Vehicle will be detonated
if (_injureCrew) then {
    {
        [QGVAR(medicalDamage), [_x, _source, _instigator], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
};

TRACE_2("detonation",_vehicle,_chanceToDetonate);

// Detonate the vehicle
[QEGVAR(cookoff,detonateAmmunitionServer), [_vehicle, false, _source, _instigator]] call CBA_fnc_serverEvent;

if (_knockOut) then {
    [_vehicle, _source, _instigator] call FUNC(knockOut);
};

_knockOut // return
