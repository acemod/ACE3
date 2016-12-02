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

private _bloodLoss = 0;
private _limbBleeding = 0;
private _bodyBleeding = 0;
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

{
    _x params ["", "", "_bodyPart", "_percentage", "_bleeeding"];
    if (_bodyPart == 1) then {
        _bodyBleeding = _bodyBleeding + (_bleeeding * _percentage);
    } else {
        if (_tourniquets select _bodyPart == 0) then {
            _limbBleeding = _limbBleeding + (_bleeeding * _percentage);
        };
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);

_bloodLoss = (_bodyBleeding + (_limbBleeding min 1)) * _cardiacOutput; // todo: find a better model

_bloodLoss * (_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)])
