/*
 * Author: Glowbal
 * Check if a unit is in a stable condition
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * Is in stable condition <BOOL>
 *
 * Example:
 * [bob] call ACE_medical_fnc_isInStableCondition
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _totalBloodLoss = 0;
{
    // total bleeding ratio * percentage of injury left
    _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
} forEach (_unit getVariable [QGVAR(openWounds), []]);

(_totalBloodLoss == 0);
