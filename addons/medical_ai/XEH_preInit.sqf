#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// default time values for AI being ready to heal, used in fnc_isSafe
if (isNil QGVAR(timeSafe_shoot)) then { GVAR(timeSafe_shoot) = 30; };
if (isNil QGVAR(timeSafe_hit)) then { GVAR(timeSafe_hit) = 30; };
if (isNil QGVAR(timeSafe_suppressed)) then { GVAR(timeSafe_suppressed) = 30; };

GVAR(itemHash) = uinamespace getVariable QGVAR(itemHash);

ADDON = true;
