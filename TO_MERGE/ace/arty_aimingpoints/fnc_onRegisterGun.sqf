//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_3(_target,_caller,_id);

if (cursorTarget isKindOf "StaticWeapon") then {
	player removeAction _id;
	player setVariable [QGVAR(registeredGun),cursorTarget,false];
};
