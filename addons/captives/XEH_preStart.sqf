#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _restraints = (QUOTE(getNumber (_x >> QQGVAR(restraint)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(restraints), compileFinal (_restraints createHashMapFromArray [])];

private _blindfolds = (QUOTE(getNumber (_x >> QQGVAR(blindfold)) > 0) configClasses (configFile >> "CfgGlasses") apply {configName _x});
uiNamespace setVariable [QGVAR(blindfolds), compileFinal (_blindfolds createHashMapFromArray [])];
