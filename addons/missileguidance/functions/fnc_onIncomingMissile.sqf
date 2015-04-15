//#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_3(_target,_ammo,_shooter);

if !(local (gunner _shooter) || {local _shooter}) exitWith {};

_shooter setVariable [QGVAR(vanilla_target),_target, false];