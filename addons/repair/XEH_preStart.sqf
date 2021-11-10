#include "script_component.hpp"

#include "XEH_PREP.hpp"

uiNamespace setVariable [
    QGVAR(allToolKits),
    compileFinal str (QUOTE(getNumber (_x >> 'ItemInfo' >> 'type') == TYPE_TOOLKIT) configClasses (configFile >> "CfgWeapons") apply {configName _x})
];
