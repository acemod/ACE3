#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _seats = QUOTE(getNumber (_x >> QQXGVAR(canSit)) == 1) configClasses (configFile >> "CfgVehicles");
_seats = _seats apply {configName _x};

uiNamespace setVariable [QGVAR(seats), compileFinal (_seats createHashMapFromArray [])];
