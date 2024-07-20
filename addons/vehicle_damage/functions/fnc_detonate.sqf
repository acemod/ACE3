#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Detonates vehicle ammo and heavily wounds all inside.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Person who caused detonation <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicle_damage_fnc_detonate;
 *
 * Public: No
 */

params ["_vehicle", ["_injurer", objNull]];

if (((_vehicle call EFUNC(cookoff,getVehicleAmmo)) select 1) > 0) then {
    {
        [QGVAR(medicalDamage), [_x, _injurer, _injurer], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
};

[QEGVAR(cookoff,detonateAmmunitionServer), [_vehicle, false, _injurer, _injurer]] call CBA_fnc_serverEvent;
