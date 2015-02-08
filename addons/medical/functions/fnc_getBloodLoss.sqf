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

#define BLOODLOSS_SMALL_WOUNDS        0.025
#define BLOODLOSS_MEDIUM_WOUNDS        0.05
#define BLOODLOSS_LARGE_WOUNDS        0.1

/**
* The default cardiac output when all stats are set to normal is 5.25.
*/
#define DEFAULT_CARDIAC_OUTPUT         5.25

private ["_totalBloodLoss","_tourniquets","_openWounds", "_value", "_cardiacOutput"];


// TODO Only use this calculation if medium or higher, otherwise use vanilla calculations (for basic medical).
_totalBloodLoss = 0;
_tourniquets = _this getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
_openWounds = _this getvariable [QGVAR(openWounds), []];
//_cardiacOutput = [_this] call FUNC(getCardiacOutput);

{
    if ((_tourniquets select (_x select 2)) < 1) then {

        _totalBloodLoss = _totalBloodLoss + ([BLOODLOSS_SMALL_WOUNDS, BLOODLOSS_MEDIUM_WOUNDS, BLOODLOSS_LARGE_WOUNDS] select (_x select 1));
        // (((BLOODLOSS_SMALL_WOUNDS * (_x select 0))) + ((BLOODLOSS_MEDIUM_WOUNDS * (_x select 1))) + ((BLOODLOSS_LARGE_WOUNDS * (_x select 2))) * (_cardiacOutput / DEFAULT_CARDIAC_OUTPUT));
    };
}foreach _openWounds;

// cap the blood loss to be no greater as the current cardiac output
//(_totalBloodLoss min _cardiacOutput);

_totalBloodLoss;