#include "script_component.hpp"

#include "initKeybinds.sqf"

["ace_laserOn", {_this call DFUNC(handleLaserOn)}] call CBA_fnc_addEventHandler;
["ace_laserOff", {_this call DFUNC(handleLaserOff)}] call CBA_fnc_addEventHandler;

