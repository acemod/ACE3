/**
 * fn_lockMutex.sqf
 * @Descr: Lock a mutex. If mutex exists and is locked, will wait until mutex becomes free, before locking it again.
 * @Author: Glowbal
 *
 * @Arguments: [mutexName STRING]
 * @Return: BOOL True if succesfullly locked.
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_mutexName","_initalStatus","_return"];
_mutexName = [_this, 0, "", [""]] call BIS_fnc_param;

_return = false;
if (_mutexName != "")then {
	private["_mutexCombinedName"];
	_mutexCombinedName = format["ACE_FRAMEWORK_MUTEX_%1",_mutexName];
	if !(isnil _mutexCombinedName) then {
		[_mutexName] call FUNC(waitForSingleMutex);
		missionNamespace setvariable [_mutexCombinedName, 1];
		_return = true;
	};
};
_return