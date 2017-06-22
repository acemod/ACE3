#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["visionMode", {
    params ["", "_visionMode"];

    GVAR(isIR) = _visionMode isEqualTo 1;
    GVAR(isTI) = _visionMode isEqualTo 2;
}] call CBA_fnc_addPlayerEventHandler;

ADDON = true;
