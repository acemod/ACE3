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
    _x params ["", "", "_bodyPart", "_percentage", "_bleedingRate"];
    if (_tourniquets select _bodyPart == 0) then {
        _bloodLossRate = _bloodLossRate + (_bleedingRate * _percentage);
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

{
    _x params ["", "", "", "_percentage", "_bleedingRate"];
    _bloodLossRate = _bloodLossRate + (_bleedingRate * _percentage);
} forEach (_unit getVariable [QGVAR(internalWounds), []]);

_bloodLossRate = _bloodLossRate * (_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)]);

if (_bloodLossRate > 0) then {
    private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
    _totalBloodLoss = _cardiacOutput * (_bloodLossRate min 1);
};

_totalBloodLoss
