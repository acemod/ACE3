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
        // random amount of injuries
        for "_i" from 0 to random 5 do {
            [_x, random 1 , selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"], selectRandom ["bullet", "shell", "explosive"], _injurer] call EFUNC(medical,addDamageToUnit);
        };
    } forEach crew _vehicle;
};

[QEGVAR(cookoff,detonateAmmunition), [_vehicle, false, _injurer, _injurer]] call CBA_fnc_serverEvent;
