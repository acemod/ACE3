/**
 * fn_releaseMutex.sqf
 * @Descr: Releases or unlocks a mutex.
 * @Author: Glowbal
 *
 * @Arguments: [mutexName STRING]
 * @Return: True if succesfully unlocked or mutex was never locked.
 * @PublicAPI: true
 */


private ["_mutexName","_initalStatus","_return"];
_mutexName = [_this, 0, "", [""]] call BIS_fnc_param;

_return = false;
if (_mutexName != "")then {
	private["_mutexCombinedName"];
	_mutexCombinedName = format["CSE_FRAMEWORK_MUTEX_%1",_mutexName];
	if !(isnil _mutexCombinedName) then {
		missionNamespace setvariable [_mutexCombinedName, 0];
		_return = true;
	};
};
_return