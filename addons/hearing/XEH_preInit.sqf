#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    if (_extendedInfo getOrDefault ["ace_earplugs", false]) then {
        _unit setVariable ["ACE_hasEarPlugsIn", true, true];

        [QGVAR(updateVolume), [[true]], _unit] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    if (_unit getVariable ["ACE_hasEarPlugsin", false]) then {
        _extendedInfo set ["ace_earplugs", true]
    };
}] call CBA_fnc_addEventHandler;

ADDON = true;
