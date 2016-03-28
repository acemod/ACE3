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
 * Example:
 * [player] call ace_medical_fnc_getBloodLoss
 *
 * Public: No
 */

#include "script_component.hpp"

#define BLOODLOSSRATE_BASIC 0.2

private ["_totalBloodLoss","_tourniquets","_openWounds", "_cardiacOutput", "_internalWounds"];
// TODO Only use this calculation if medium or higher, otherwise use vanilla calculations (for basic medical).
params ["_unit"];
_totalBloodLoss = 0;

private _bloodLossMuliplier = _unit getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];
_bloodLossMuliplier = _bloodLossMuliplier apply { 1 + _x^2 };  

// Advanced medical bloodloss handling
if (GVAR(level) >= 2) then {
    _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
    _openWounds = _unit getVariable [QGVAR(openWounds), []];
    //_cardiacOutput = [_unit] call FUNC(getCardiacOutput);

    {
        _x params ["", "", "_woundPartNum", "_woundInjury", "_woundBloodLoss"];
        if ((_tourniquets select (_x select 2)) == 0) then {
            // total bleeding ratio * percentage of injury left
            _totalBloodLoss = _totalBloodLoss + (_woundInjury * _woundBloodLoss * (_bloodLossMuliplier select _woundPartNum));

            // (((BLOODLOSS_SMALL_WOUNDS * (_x select 0))) + ((BLOODLOSS_MEDIUM_WOUNDS * (_x select 1))) + ((BLOODLOSS_LARGE_WOUNDS * (_x select 2))) * (_cardiacOutput / DEFAULT_CARDIAC_OUTPUT));
        };
    } forEach _openWounds;

    // _internalWounds = _unit getVariable [QGVAR(internalWounds), []];
    // {
        // _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
    // } forEach _internalWounds;

    // cap the blood loss to be no greater as the current cardiac output
    //(_totalBloodLoss min _cardiacOutput);
} else {
    { _totalBloodLoss = _totalBloodLoss + (_x * (_bloodLossMuliplier select _woundPartNum)) } forEach (_unit getVariable [QGVAR(bodyPartStatus), []]);
    _totalBloodLoss = (_totalBloodLoss / 6) * BLOODLOSSRATE_BASIC;
};
_totalBloodLoss * ((_unit getVariable [QGVAR(bleedingCoefficient), GVAR(bleedingCoefficient)]) max 0);
