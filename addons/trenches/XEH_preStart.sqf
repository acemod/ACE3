#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _entrenchingTools = 
(QUOTE(getNumber (_x >> QQGVAR(entrenchingTool)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x}) +
(QUOTE(getNumber (_x >> QQGVAR(entrenchingTool)) > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});

uiNamespace setVariable [
    QGVAR(entrenchingTools),
    compileFinal str _entrenchingTools
];
