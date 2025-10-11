#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

missionNamespace setVariable [QGVAR(inProgress), false];

// Cache Wardrobe Replace Exceptions
private _map = createHashMap;
{
    _map set [
        configName _x,
        [
            toLower getText (_x >> "mode"),
            getText (_x >> "code") call CBA_fnc_convertStringCode
        ]
    ];
} forEach ("true" configClasses (configFile >> QGVAR(exceptions)));
GVAR(exceptions) = _map;

[
    QGVAR(exceptions),
    { _this call (GVAR(exceptions) get (_this#0) select 1) }
] call CBA_fnc_addEventHandler;


ADDON = true;
