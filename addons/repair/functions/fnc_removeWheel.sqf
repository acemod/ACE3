/*
 * Author: commy2
 *
 * Start a remove wheel action and open progress bar.
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

params ["_caller", "_vehicle", "_hitPoint"];
TRACE_3("params",_caller,_vehicle,_hitPoint);

// exit if not a valid hitpoint
if !(_hitPoint in ([_vehicle] call EFUNC(common,getHitPoints))) exitWith {};

// calculate time to fully repair the hitpoint
private "_time";
_time = 10;

// open the loading bar
[_time, [_caller, _vehicle, _hitPoint], {(_this select 0) call DFUNC(doRemoveWheel)}, {[localize "STR_ACE_Common_ActionAborted"] call EFUNC(common,displayTextStructured);}, localize "STR_ACE_Repair_RemovingWheel", {(_this select 0) call DFUNC(canRemoveWheel)}, []] call EFUNC(common,progressBar);

// do animation
[_caller] call EFUNC(common,goKneeling);

// @todo play sound
