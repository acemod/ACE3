#include "script_component.hpp"

private _lasers = ((toString {(getNumber (_x >> "ACE_laserpointer")) > 0}) configClasses (configFile >> "CfgWeapons")) apply {configName _x};
if (_lasers isNotEqualTo []) then { WARNING_1("%1 attachements still using unsupported ACE_laserpointer config",count _lasers) };
uiNamespace setVariable [QGVAR(oldLasers), compileFinal (_lasers createHashMapFromArray [])];
