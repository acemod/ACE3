#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _weapons = (configProperties [configfile >> "CfgWeapons", QUOTE(isClass _x && {isText (_x >> QQGVAR(vehicle))}), true]) apply {configName _x};
uiNamespace setVariable [QGVAR(flagItems), compileFinal str _weapons];
