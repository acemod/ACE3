/**
 * fn_getBloodLoss.sqf
 * @Descr: Calculate the total blood loss of a unit.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: NUMBER Total blood loss of unit
 * @PublicAPI: true
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

_totalBloodLoss = 0;
_tourniquets = [_this, QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
_openWounds = [_this, QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
_cardiacOutput = [_this] call FUNC(getCardiacOutput);

{
    if ((_tourniquets select _foreachIndex) < 1) then {
        _totalBloodLoss = _totalBloodLoss + (((BLOODLOSS_SMALL_WOUNDS * (_x select 0))) + ((BLOODLOSS_MEDIUM_WOUNDS * (_x select 1))) + ((BLOODLOSS_LARGE_WOUNDS * (_x select 2))) * (_cardiacOutput / DEFAULT_CARDIAC_OUTPUT));
    };
}foreach _openWounds;

// cap the blood loss to be no greater as the current cardiac output
(_totalBloodLoss min _cardiacOutput);