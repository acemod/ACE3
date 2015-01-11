//fnc_lamp.sqf
#include "\x\ace\addons\sys_arty_aimingpoints\script_component.hpp"
_currentState = GVAR(currentAimingCircle) getVariable [QGVAR(aimingCircleLampOn), false];
GVAR(currentAimingCircle) setVariable [QGVAR(aimingCircleLampOn), !_currentState, true];
[QGVAR(aimingCircleLightEvent), [GVAR(currentAimingCircle), !_currentState]] call CBA_fnc_globalEvent;