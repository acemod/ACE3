#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (hasInterface && !is3DEN) then {

    ["CBA_settingsInitialized", {
        if (GVAR(enabled)) then {

            ["vehicle",{
                [false] call FUNC(adaptViewDistance);
            }] call CBA_fnc_addPlayerEventHandler;

            ["ACE_controlledUAV", {
                [false] call FUNC(adaptViewDistance);
            }] call CBA_fnc_addEventHandler;

        };
    }] call CBA_fnc_addEventHandler;

};

ADDON = true;
