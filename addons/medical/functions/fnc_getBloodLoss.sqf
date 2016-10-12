/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Total blood loss of unit <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _totalBloodLoss = 0;
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

{
    if (_tourniquets select (_x select 2) == 0) then {
        // total bleeding ratio * percentage of injury left
        _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

{
    _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
} forEach (_unit getVariable [QGVAR(internalWounds), []]);

_totalBloodLoss * ((_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)]) max 0) * DEFAULT_BLOOD_VOLUME / 100;
