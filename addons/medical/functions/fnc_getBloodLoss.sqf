/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Total blood loss of unit (liter per second) <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _totalBloodLoss = 0;
private _bloodLossRate = 0;
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

{
    if (_tourniquets select (_x select 2) == 0) then {
        // total bleeding ratio * percentage of injury left
        _bloodLossRate = _bloodLossRate + ((_x select 4) * (_x select 3));
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

{
    _bloodLossRate = _bloodLossRate + ((_x select 4) * (_x select 3));
} forEach (_unit getVariable [QGVAR(internalWounds), []]);

_bloodLossRate = _bloodLossRate * (_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)]);

if (_bloodLossRate > 0) then {
    private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
    _totalBloodLoss = _cardiacOutput * (_bloodLossRate min 1);
};

_totalBloodLoss
