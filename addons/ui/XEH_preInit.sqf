#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(interfaceInitialized) = false;

GVAR(speedIndicatorIconHash) = createHashMapFromArray [
    // Standing/Crouched
    [["wlk", false], QPATHTOF(ui\speed_indicator\1_ca.paa)],
    [["tac", false], QPATHTOF(ui\speed_indicator\2_ca.paa)],
    [["run", false], QPATHTOF(ui\speed_indicator\3_ca.paa)],
    [["eva", false], QPATHTOF(ui\speed_indicator\4_ca.paa)],
    // Prone
    [["wlk", true], QPATHTOF(ui\speed_indicator\1_ca.paa)],
    [["run", true], QPATHTOF(ui\speed_indicator\2_ca.paa)],
    [["spr", true], QPATHTOF(ui\speed_indicator\3_ca.paa)],
    [["eva", true], QPATHTOF(ui\speed_indicator\4_ca.paa)]
];

ADDON = true;
