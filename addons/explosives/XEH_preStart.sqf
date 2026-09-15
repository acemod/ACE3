#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _defusalKits = (QUOTE(getNumber (_x >> QQGVAR(defusalKit)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(defusalKits), compileFinal (_defusalKits createHashMapFromArray [])];

private _detonators = (QUOTE(getNumber (_x >> QQGVAR(detonator)) == 1) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(detonators), compileFinal (_detonators createHashMapFromArray [])];
