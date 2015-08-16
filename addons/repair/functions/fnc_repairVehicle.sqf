/*
 * Author: commy2
 * Starts a repair action with a progress bar.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_repairVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

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
    _text = format [localize LSTRING(RepairingHitPoint), localize _text];
} else {
    _text = localize LSTRING(Repairing);
};

// open the loading bar
[_time, [_unit, _vehicle, _hitPoint], {_this call DFUNC(doRepair)}, {_this call DFUNC(doRepair)}, _text, {(_this select 0) call DFUNC(canRepair)}, []] call EFUNC(common,progressBar);

// do animation
[_unit] call EFUNC(common,goKneeling);

// @todo play sound
