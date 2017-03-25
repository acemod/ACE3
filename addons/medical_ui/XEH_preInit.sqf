#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(painEffectType),
    "LIST",
    [localize LSTRING(painEffectType), "Selects the used pain effect type"], //@todo
    "ACE Medical", // @todo
    [
        [0, 1],
        [localize LSTRING(painEffectType_whiteFlashing), localize LSTRING(painEffectType_pulsingBlur)],
        0
    ],
    false,
    {
        if (isNil QGVAR(ppPain)) exitWith {TRACE_1("Before Post-Init",_this)};
        TRACE_1("reseting ppEffect type",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_Settings_fnc_init;

GVAR(lastHeartBeatSound) = 0;

ADDON = true;
