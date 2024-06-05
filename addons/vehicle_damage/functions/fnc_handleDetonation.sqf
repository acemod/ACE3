#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks hitpoint damage and determines if a vehicle should detonate its ammo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Chance of detonation <NUMBER>
 * 2: If the vehicle has been knocked out <BOOL>
 * 3: Source of damage <OBJECT>
 * 4: Person who caused damage <OBJECT>
 *
 * Return Value:
 * Detonated <BOOL>
 *
 * Example:
 * [cursorObject, 0.5, true, player, player] call ace_vehicle_damage_fnc_handleDetonation
 *
 * Public: No
 */

params ["_vehicle", "_chanceOfDetonation", "_isKnockedOut", "_source", "_instigator"];
TRACE_5("handleDetonation",_vehicle,_chanceOfDetonation,_isKnockedOut,_source,_instigator);

// Ignore if the vehicle is already detonating ammo
if (_vehicle getVariable [QEGVAR(cookoff,isAmmoDetonating), false]) exitWith {_isKnockedOut};

// Detonate the vehicle
if (_chanceOfDetonation >= random 1) exitWith {
    if (((_vehicle call EFUNC(cookoff,getVehicleAmmo)) select 1) > 0) then {
        {
            [QGVAR(medicalDamage), [_x, _source, _instigator], _x] call CBA_fnc_targetEvent;
        } forEach (crew _vehicle);
    };

    [QEGVAR(cookoff,detonateAmmunitionServer), [_vehicle, false, _source, _instigator]] call CBA_fnc_serverEvent;

    TRACE_2("detonation",_vehicle,_chanceOfDetonation);

    _isKnockedOut
};

TRACE_2("no detonation",_vehicle,_chanceOfDetonation);

false
