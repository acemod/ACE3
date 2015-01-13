/**
 * fn_repackMagazinesAll.sqf
 * @Descr: Repacks all magazines of a unit
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: [unit OBJECT]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_unit", "_passedMags"];
_unit = _this select 0;

_passedMags = [];
{
	if (!((_x select 0) in _passedMags)) then {
		_passedMags pushback (_x select 0);
		[_unit, (_x select 0)] call cse_fnc_repackMagazines;
	};
} forEach (magazinesAmmo _unit);
