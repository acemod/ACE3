#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _restraints = (QUOTE(getNumber (_x >> QQGVAR(restraint)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(restraints), compileFinal str _restraints];

private _lockedRestraints = (QUOTE(getNumber (_x >> QQGVAR(locked)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(lockedRestraints), compileFinal str _lockedRestraints];

private _keys = (QUOTE(getNumber (_x >> QQGVAR(key)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(keys), compileFinal str _keys];
