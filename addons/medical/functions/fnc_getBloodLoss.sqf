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

private ["_totalBloodLoss","_tourniquets","_openWounds", "_value", "_cardiacOutput", "_internalWounds"];
// TODO Only use this calculation if medium or higher, otherwise use vanilla calculations (for basic medical).
_totalBloodLoss = 0;

// Advanced medical bloodloss handling
if (GVAR(level) >= 1) then {
    _tourniquets = _this getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
    _openWounds = _this getvariable [QGVAR(openWounds), []];
    //_cardiacOutput = [_this] call FUNC(getCardiacOutput);

    {
        if ((_tourniquets select (_x select 2)) == 0) then {
            // total bleeding ratio * percentage of injury left
            _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));

            // (((BLOODLOSS_SMALL_WOUNDS * (_x select 0))) + ((BLOODLOSS_MEDIUM_WOUNDS * (_x select 1))) + ((BLOODLOSS_LARGE_WOUNDS * (_x select 2))) * (_cardiacOutput / DEFAULT_CARDIAC_OUTPUT));
        };
    }foreach _openWounds;

    _internalWounds = _this getvariable [QGVAR(internalWounds), []];
    {
        _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
    }foreach _internalWounds;

    // cap the blood loss to be no greater as the current cardiac output
    //(_totalBloodLoss min _cardiacOutput);
} else {
    // TODO basic medical
};
_totalBloodLoss;
