//fnc_needle.sqf
#include "\x\ace\addons\sys_arty_aimingpoints\script_component.hpp"
_needleUnlocked = GVAR(currentAimingCircle) getVariable[QGVAR(aimingCircleNeedleUnlocked), false];
GVAR(currentAimingCircle) setVariable[QGVAR(aimingCircleNeedleUnlocked), !_needleUnlocked];