/*
 * Author: commy2
 *
 * Start a replace wheel action and open progress bar.
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

// get nearest wheel
private "_wheel";
_wheel = objNull;

{
    if ([_unit, _x, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {
        _wheel = _x;
    };
} forEach nearestObjects [_unit, ["ACE_Wheel"], 5];

if (isNull _wheel) exitWith {};

[_unit, _wheel] call EFUNC(common,claim);

// calculate time to fully repair the hitpoint
private "_time";
_time = 10;

// get string of the hitpoint
private "_text";
_text = "REPLACE WHEEL";

// open the loading bar
[_time, [_unit, _vehicle, _hitPoint, _wheel], {(_this select 0) call DFUNC(doReplaceWheel)}, {[objNull, _this select 0 select 3] call DEFUNC(common,claim); hint "abort"}, _text, {true}, []] call EFUNC(common,progressBar);

// do animation
[_unit] call EFUNC(common,goKneeling);

// @todo play sound
