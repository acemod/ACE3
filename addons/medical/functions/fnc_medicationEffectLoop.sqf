#include "script_component.hpp"
/*
 * Author: Glowbal, esteldunedain
 * Medication effect loop for an injection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Name of the Variable that is affected <STRING>
 * 2: Proportion of the effect applied <NUMBER>
 * 3: Rate at which the effect is applied <NUMBER>
 * 4: Viscosity adjustment rate <NUMBER>
 * 5: Pain reduction rate <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "leg", 1, 2, 3, 4] call ACE_medical_fnc_medicationEffectLoop
 *
 * Public: No
 */

params ["_unit", "_variableName", "_amountDecreased","_decreaseRate", "_viscosityAdjustmentRate", "_painReduceRate"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed finish the local loop
if (!local _unit) exitWith {};

// Apply medicinal effect
private _usedMeds = (_unit getVariable [_variableName, 0]) - _decreaseRate;
_unit setVariable [_variableName, _usedMeds];

// Restore the viscosity while the medication is leaving the system
_unit setVariable [QGVAR(peripheralResistance), ((_unit getVariable [QGVAR(peripheralResistance), 100]) - _viscosityAdjustmentRate) max 0];
_unit setVariable [QGVAR(painSuppress), ((_unit getVariable [QGVAR(painSuppress), 0]) - _painReduceRate) max 0];

// Exit if the medication has finished it's effect
_amountDecreased = _amountDecreased + _decreaseRate;
if (_amountDecreased >= 1 || (_usedMeds <= 0) || !alive _unit) exitWith {};

// Schedule the loop to be executed again 1 sec later
[DFUNC(medicationEffectLoop), [_unit, _variableName, _amountDecreased, _decreaseRate, _viscosityAdjustmentRate, _painReduceRate], 1] call CBA_fnc_waitAndExecute;
