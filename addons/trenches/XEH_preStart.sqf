#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _entrenchingTools = [];

uiNamespace setVariable [
    QGVAR(entrenchingTools),
    compileFinal str (QUOTE(getNumber (_x >> QQGVAR(entrenchingTool)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x})
];
