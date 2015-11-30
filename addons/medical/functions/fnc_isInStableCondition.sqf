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
* Public: No
*/

#include "script_component.hpp"

private ["_openWounds", "_openWounds"];
params ["_unit"];

if (GVAR(level) <= 1) exitWith {
    ([_unit] call FUNC(getBloodloss)) == 0;
};

_totalBloodLoss = 0;
_openWounds = _unit getVariable [QGVAR(openWounds), []];
{
    // total bleeding ratio * percentage of injury left
    _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
} forEach _openWounds;

(_totalBloodLoss == 0);
