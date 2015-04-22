/*
 * Author: commy2
 *
 * Start a repair action and open progress bar.
 *
 * Arguments:
 * 0: Unit that does the repairing (Object)
 * 1: vehicle to repair (Object)
 * 2: Selected hitpoint (String)
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_vehicle", "_hitPoint"];

_unit = _this select 0;
_vehicle = _this select 1;
_hitPoint = _this select 2;

// exit if not a valid hitpoint
if !(_hitPoint in ([_vehicle] call EFUNC(common,getHitPoints))) exitWith {};

// calculate time to fully repair the hitpoint
private ["_damage", "_time"];

_damage = _vehicle getHitPointDamage _hitPoint;

_time = (5 + 10 * _damage) * ([1.5, 1] select ([_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)));

// get string of the hitpoint
private "_text";
_text = format ["STR_ACE_Repair_%1", _hitPoint];

if (isLocalized _text) then {
	_text = format [localize "STR_ACE_Repair_RepairingHitPoint", localize _text];
} else {
	_text = localize "STR_ACE_Repair_Repairing";
};

// open the loading bar
[_time, [_unit, _vehicle, _hitPoint], {_this call DFUNC(doRepair)}, {_this call DFUNC(doRepair)}, _text, {true}, []] call EFUNC(common,progressBar);

// do animation
[_unit] call EFUNC(common,goKneeling);

// @todo play sound
