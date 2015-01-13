/**
 * fn_waitForMultipleMutex.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_mutexes"];
_mutexes = _this;
{
	if (typeName _x == typeName "") then {
		[_x, -1] call FUNC(waitForSingleMutex);
	};
}foreach _mutexes;