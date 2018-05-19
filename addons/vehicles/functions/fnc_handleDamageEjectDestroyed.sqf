/*
 * Author: Dystopian
 * Ejects crew from destroyed vehicle.
 * Should be called from HandleDamage EH.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_vehicles_fnc_handleDamageEjectDestroyed
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "", "", "", "_ammo"];

if (alive _vehicle) exitWith {};

TRACE_2("ejectDestroyed HDEH",typeOf _vehicle,_this);

if (0.5 >= getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive")) then {
    {
        if (alive _x) then {
            moveOut _x;
        };
    } forEach crew _vehicle;
};

_vehicle removeEventHandler ["HandleDamage", _thisEventHandler];
