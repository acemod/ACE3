#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[
    QGVAR(painEffectType),
    "LIST",
    [localize LSTRING(painEffectType), "Selects the used pain effect type"], //@todo
    "ACE Medical", // @todo
    [
        [0, 1],
        ["White flashing", "Pulsing blur"],
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
