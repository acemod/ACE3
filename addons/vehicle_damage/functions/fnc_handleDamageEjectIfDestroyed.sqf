#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Ejects crew from destroyed vehicle.
 * Should be called from HandleDamage EH.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Selection (not used) <STRING>
 * 2: New level of damage (not used) <NUMBER>
 * 3: Source of damage (not used) <OBJECT>
 * 4: Projectile that caused damage <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_vehicle_damage_fnc_handleDamageEjectIfDestroyed
 *
 * Public: No
 */

params ["_vehicle", "_selection", "_damage", "", "_projectile"];

if (
    alive _vehicle
    && {_selection isNotEqualTo "" || {_damage < 1}} // overall structural damage
) exitWith {};

TRACE_5("handleDamageEjectIfDestroyed",alive _vehicle,speed _vehicle,velocity _vehicle,typeOf _vehicle,_this);

//IGNORE_PRIVATE_WARNING ["_thisEventHandler"];
_vehicle removeEventHandler ["HandleDamage", _thisEventHandler];

if (_projectile isNotEqualTo "") exitWith {
    if (IS_INEXPLOSIVE_AMMO(_projectile)) then {
        {
            moveOut _x;
        } forEach crew _vehicle;
    };
};

if (_vehicle isKindOf "StaticWeapon") exitWith {
    {
        moveOut _x;
    } forEach crew _vehicle;
};

// boat collision damage
{
    moveOut _x;
    private _posASL = getPosASLW _x;
    // if moved out under water, move it upper
    if (_posASL select 2 < 0.5) then {
        TRACE_3("move up",_x,_posASL select 2,velocity _x);
        _posASL set [2, 0.5];
        _x setPosASLW _posASL;
    };
} forEach crew _vehicle;
