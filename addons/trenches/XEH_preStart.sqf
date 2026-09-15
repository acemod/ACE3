#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _entrenchingTools = (QUOTE(getNumber (_x >> QQGVAR(entrenchingTool)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
_entrenchingTools append    (QUOTE(getNumber (_x >> QQGVAR(entrenchingTool)) > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});
TRACE_1("",_entrenchingTools);

uiNamespace setVariable [QGVAR(entrenchingTools), compileFinal (_entrenchingTools createHashMapFromArray [])];
