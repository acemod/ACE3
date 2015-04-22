/*
 * Author: commy2
 *
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * Stuff from progress bar.
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_vehicle", "_hitPoint"];

_unit = _this select 0;
_vehicle = _this select 1;
_hitPoint = _this select 2;


// get current hitpoint damage
private "_hitPointDamage";
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't remove destroyed or already removed wheel
if (_hitPointDamage >= 1) exitWith {};

// don't die by spawning / moving the wheel
["fixCollision", _unit] call EFUNC(common,localEvent);

// spawn wheel
private "_wheel";
_wheel = ["ACE_Wheel", getPosASL _unit] call FUNC(spawnObject);
_wheel setdamage _hitPointDamage;

// raise event to set the new hitpoint damage
["setWheelHitPointDamage", _vehicle, [_vehicle, _hitPoint, 1]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [localize "STR_ACE_Repair_RemovedWheel"] call EFUNC(common,displayTextStructured);
};
