/**
 * fn_isHC.sqf
 * @Descr: Check if current locality is a headless client
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: BOOL True if locality is headless client OR is not in multiplayer
 * @PublicAPI: true
 */

private ["_return"];

if (!isMultiplayer) then {
	_return = true;
} else {
	if (isServer && !isDedicated) then {
		_return = true;
	} else {
		_return = !(hasInterface || isDedicated);
	};
};
_return