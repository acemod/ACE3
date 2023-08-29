#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _cableTies = (QUOTE(getNumber (_x >> QQGVAR(is_Cable_Tie)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
uiNamespace setVariable [QGVAR(cableTies), compileFinal str _cableTies];
