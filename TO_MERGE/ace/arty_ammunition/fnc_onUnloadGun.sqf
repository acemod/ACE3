//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_shell","_prepArray","_shellClass","_defaultClass"];
PARAMS_1(_gun);

_prepArray = _gun getVariable ["ace_sys_arty_currentRound", []];
if (count _prepArray > 0) then {
	_defaultClass = getText(configFile >> "CfgMagazines" >> (_prepArray select 0) >> "ACE_ARTY_DEFAULT_CLASS");
	_shellClass = getText(configFile >> "CfgMagazines" >> _defaultClass >> "ACE_ARTY_SHELL_VEHICLE");
	_gun setVariable ["ace_sys_arty_currentRound",[],true];
	_shell = _shellClass createVehicle getPos _gun;
	_shell setVariable ["ACE_ARTY_PREP",_prepArray,true];
};
