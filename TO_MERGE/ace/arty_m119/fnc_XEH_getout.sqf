//#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_3(_gun,_pos,_unit);

if (_unit == player) then {
	GVAR(activeGun) = nil;
	
	[] call ace_sys_arty_aimingpoints_fnc_endCollimatorHandler;
	
	[QGVAR(leftTraverseSmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(leftTraverseVerySmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(leftTraverseLarge)] call CBA_fnc_removeKeyHandler;
	[QGVAR(rightTraverseSmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(rightTraverseVerySmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(rightTraverseLarge)] call CBA_fnc_removeKeyHandler;
	[QGVAR(elevateUpSmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(elevateUpLarge)] call CBA_fnc_removeKeyHandler;
	[QGVAR(elevateDownSmall)] call CBA_fnc_removeKeyHandler;
	[QGVAR(elevateDownLarge)] call CBA_fnc_removeKeyHandler;

	{
		_gun removeAction _x;
	} forEach GVAR(gunActionIds);
	GVAR(gunActionIds) = [];

	_gun setVariable [QGVAR(azimuthCounter), _gun getVariable QGVAR(azimuthCounter), true];
	_gun setVariable [QGVAR(deflectionCounter), _gun getVariable QGVAR(deflectionCounter), true];
	_gun setVariable [QGVAR(elevationCounter), _gun getVariable QGVAR(elevationCounter), true];
	_gun setVariable [QGVAR(resetCounter), _gun getVariable QGVAR(resetCounter), true];
	_gun setVariable [QGVAR(resetPhase), _gun getVariable QGVAR(resetPhase), true];
};
