#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _fortifyTools = (QUOTE(getNumber (_x >> QQGVAR(fortifyTool)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
_fortifyTools append    (QUOTE(getNumber (_x >> QQGVAR(fortifyTool)) > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});
TRACE_1("",_fortifyTools);

uiNamespace setVariable [QGVAR(fortifyTools), compileFinal (_fortifyTools createHashMapFromArray [])];
