/**
 * fn_waitForSingleMutex.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_mutexName","_timeout","_return"];
_mutexName = [_this, 0, "", [""]] call BIS_fnc_param;
if (count _this > 1) then {
	_timeout = [_this, 1, -1, [-1]] call BIS_fnc_param;
};

_return = false;
if (_mutexName != "") then {
	private["_mutexCombinedName"];
	_mutexCombinedName = format["ACE_FRAMEWORK_MUTEX_%1",_mutexName];
	if !(isnil _mutexCombinedName) then {
		_startTime = time;
		waituntil {((missionNamespace getvariable [_mutexCombinedName, 0]) == 0) || ((time - _startTime > (_timeout*accTime)) && _timeout > 0)};
		_return = (missionNamespace getvariable [_mutexCombinedName, 0]) == 0;
	};
};
_return