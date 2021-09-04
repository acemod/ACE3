#include "script_component.hpp"
/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit (litres/second) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getBloodLoss
 *
 * Public: No
 */

params ["_unit"];

private _woundBleeding = GET_WOUND_BLEEDING(_unit);
if (_woundBleeding == 0) exitWith {0};

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
private _resistance = _unit getVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES]; // since this is measured as a percentage of default, can use value directly

// even if heart stops blood will still flow slowly (gravity)
(_woundBleeding * (_cardiacOutput max 0.05) * (DEFAULT_PERIPH_RES / _resistance) * EGVAR(medical,bleedingCoefficient))
