/*
 * Author: Glowbal
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * 0: BloodPressure Low <NUMBER>
 * 1: BloodPressure High <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

// Value is taken because with cardic output and resistance at default values, it will put blood pressure High at 120.
#define MODIFIER_BP_HIGH     0.229

// Value is taken because with cardic output and resistance at default values, it will put blood pressure Low at 80.
#define MODIFIER_BP_LOW     0.1524

private ["_bloodPressureLow", "_bloodPressureHigh", "_cardiacOutput", "_resistance"];

params ["_unit"];

_cardiacOutput = [_unit] call FUNC(getCardiacOutput);
_resistance = _unit getVariable [QGVAR(peripheralResistance), 100];

_bloodPressureHigh = (_cardiacOutput * MODIFIER_BP_HIGH) * _resistance;
_bloodPressureLow = (_cardiacOutput * MODIFIER_BP_LOW) * _resistance;

[_bloodPressureLow max 0, _bloodPressureHigh max 0]
