#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Update temperature of a weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Heat increment (J) <NUMBER>
 *
 * Return Value:
 * Current temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player, 2000] call ace_overheating_fnc_updateTemperature
 *
 * Public: No
 */

params ["_unit", "_weapon", "_heatIncrement"];
TRACE_3("params",_unit,_weapon,_heatIncrement);

// get old values
// each weapon has it's own variable. Can't store the temperature in the weapon since they are not objects unfortunately.
private _tempVarName = format [QGVAR(%1_temp), _weapon];
private _timeVarName = format [QGVAR(%1_time), _weapon];
private _temperature = _unit getVariable [_tempVarName, 0];
private _lastTime = _unit getVariable [_timeVarName, 0];

private _barrelMass = _weapon call FUNC(getBarrelMass);

// Calculate cooling
_temperature = [_temperature, _barrelMass, CBA_missionTime - _lastTime] call FUNC(calculateCooling);

TRACE_1("cooledTo",_temperature);
// Calculate heating
// Steel Heat Capacity = 466 J/(Kg.K)
_temperature = _temperature + _heatIncrement * GVAR(heatCoef) / (_barrelMass * 466);

// Publish the temperature variable
[_unit, _tempVarName, _temperature, TEMP_TOLERANCE] call EFUNC(common,setApproximateVariablePublic);
// Store the update time locally
_unit setVariable [_timeVarName, CBA_missionTime];

_temperature
