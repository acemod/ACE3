#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// List of units with an enabled IR light
GVAR(units) = [];

[QGVAR(switchedLight), {
    params ["_unit", "_lightOn"];

    if (_lightOn) then {
        _unit action ["GunLightOn", _unit];
        GVAR(units) pushBack _unit;
    } else {
        _unit action ["GunLightOff", _unit];
        GVAR(units) deleteAt (GVAR(units) find _unit);
    };
}] call CBA_fnc_addEventHandler;

["loadout",    FUNC(handleLoadoutChanged)]    call CBA_fnc_addPlayerEventHandler;
["visionMode", FUNC(handleVisionModeChanged)] call CBA_fnc_addPlayerEventHandler;

ADDON = true;
