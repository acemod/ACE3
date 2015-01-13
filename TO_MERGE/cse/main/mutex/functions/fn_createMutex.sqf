/**
 * fn_createMutex.sqf
 * @Descr: Create a Mutex
 * @Author: Glowbal
 *
 * @Arguments: [mutexName STRING, intialStatus BOOL (True if initial status is locked)]
 * @Return: BOOL True if mutex has been created.
 * @PublicAPI: true
 */

private ["_mutexName","_initalStatus","_return"];
_mutexName = [_this, 0, "", [""]] call BIS_fnc_param;
_initalStatus = [_this, 1, false, [false]] call BIS_fnc_param;
_return = false;
if (_mutexName != "") then {
	private["_mutexCombinedName"];
	_mutexCombinedName = format["CSE_FRAMEWORK_MUTEX_%1",_mutexName];
	if (isnil _mutexCombinedName) then {
		missionNamespace setvariable [_mutexCombinedName, _initalStatus];
		_return = true;
	};
};

_return