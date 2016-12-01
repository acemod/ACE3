#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[
    QGVAR(painEffectType),
    "LIST",
    ["Pain effect type", "Selects the used pain effect type"], //@todo
    "ACE Medical", // @todo
    [
        [0, 1],
        ["White flashing", "Pulsing blur"],
        0
    ],
    false,
    {} // TODO!
] call CBA_Settings_fnc_init;

ADDON = true;
