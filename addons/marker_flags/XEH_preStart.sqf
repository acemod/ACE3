#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _weapons = (QUOTE(isText (_x >> QQGVAR(vehicle))) configClasses (configFile >> "CfgWeapons")) apply {configName _x};
uiNamespace setVariable [QGVAR(flagItems), compileFinal str _weapons];
