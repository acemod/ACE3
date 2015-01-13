/**
 * fn_hasFlare_EQ.sqf
 * @Descr: Check if given unit has a flare.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private[ "_unit", "_return"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
if !(_unit isKindof "CAManBase") exitwith {false};
_return = false;
{
	if ([_x] call cse_fnc_isFlare_EQ) exitwith {_return = true;};
}foreach (magazines _unit);

_return