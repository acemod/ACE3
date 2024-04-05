#include "..\script_component.hpp"
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

// even if heart stops blood will still flow slowly (gravity)
private _loss = (_woundBleeding * (_cardiacOutput max CARDIAC_OUTPUT_MIN) * EGVAR(medical,bleedingCoefficient));
[QGVAR(getBloodLoss), [_unit, _loss]] call CBA_fnc_localEvent;
_loss
