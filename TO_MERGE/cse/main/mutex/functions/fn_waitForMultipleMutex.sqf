/**
 * fn_waitForMultipleMutex.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_mutexes"];
_mutexes = _this;
{
	if (typeName _x == typeName "") then {
		[_x, -1] call cse_fnc_waitForSingleMutex;
	};
}foreach _mutexes;