#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache wirecutter item classes, see XEH_postInit.sqf
private _possibleWirecutters = ("getNumber (_x >> 'ACE_isWirecutter') == 1" configClasses (configFile >> "CfgWeapons")) apply {configName _x};
uiNamespace setVariable [QGVAR(possibleWirecutters), compileFinal str _possibleWirecutters];
