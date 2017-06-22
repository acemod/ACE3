/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit <NUMBER>
 *
 * Example:
 * [bob] call ACE_medical_fnc_getBloodLoss
 *
 * Public: No
 */

#include "script_component.hpp"

#define BLOODLOSSRATE_BASIC 0.2

// TODO Only use this calculation if medium or higher, otherwise use vanilla calculations (for basic medical).
params ["_unit"];

private _totalBloodLoss = 0;
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
{
    if ((_tourniquets select (_x select 2)) == 0) then {
        // total bleeding ratio * percentage of injury left
        _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
        // (((BLOODLOSS_SMALL_WOUNDS * (_x select 0))) + ((BLOODLOSS_MEDIUM_WOUNDS * (_x select 1))) + ((BLOODLOSS_LARGE_WOUNDS * (_x select 2))) * (_cardiacOutput / DEFAULT_CARDIAC_OUTPUT));
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

{
    _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
} forEach (_unit getVariable [QGVAR(internalWounds), []]);

_totalBloodLoss * ((_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)]) max 0);
