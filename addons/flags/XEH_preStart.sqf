#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _flagItems = (configProperties [configfile >> "CfgWeapons", QUOTE(isClass _x && {isText (_x >> QQGVAR(texture))}), true]) apply {configName _x};
uiNamespace setVariable [QGVAR(allFlagItems), compileFinal str _flagItems];
