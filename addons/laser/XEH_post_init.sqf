#include "script_component.hpp"

#include "initKeybinds.sqf"

["ace_laser_laserOn", {_this call DFUNC(handleLaserOn)}] call CBA_fnc_addEventHandler;
["ace_laser_laserOff", {_this call DFUNC(handleLaserOff)}] call CBA_fnc_addEventHandler;

