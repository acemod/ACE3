/**
 * fn_ALiVE_BUS_Mod.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_busArguments","_return"];
_busArguments = [_this, 0, [], [[]]] call BIS_fnc_Param;
if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
	_return = _busArguments call ALiVE_fnc_BUS;
};
_return