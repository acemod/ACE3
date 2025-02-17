#include "..\script_component.hpp"
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
 * _this call ace_vehicle_damage_fnc_handleDamageEjectIfDestroyed
 *
 * Public: No
 */

params ["_vehicle", "", "", "", "_ammo"];

if (alive _vehicle) exitWith {};

TRACE_2("handleDamageEjectIfDestroyed",typeOf _vehicle,_this);

if (IS_INEXPLOSIVE_AMMO(_ammo)) then {
    {
        if (alive _x) then {
            moveOut _x;
        };
    } forEach crew _vehicle;
};

//IGNORE_PRIVATE_WARNING ["_thisEventHandler"];
_vehicle removeEventHandler ["HandleDamage", _thisEventHandler];
