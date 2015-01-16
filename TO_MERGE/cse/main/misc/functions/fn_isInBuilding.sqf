/**
 * fn_isInBuilding.sqf
 * @Descr: Check is unit is within a building
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit is under a roof
 * @PublicAPI: true
 */

private ["_unit","_eyePos","_obj","_isInBuilding"];
_unit = _this select 0;

_eyePos = eyePos _unit;
_isInBuilding = false;
_obj = (lineIntersectsWith [_unit modelToWorld [0, 0, (_eyePos select 2)], _unit modelToWorld [0, 0, (_eyePos select 2) +10], _unit]);
{
	if (_x isKindOf "Building") exitwith {
		_isInBuilding = true;
	};
}foreach _obj;

_isInBuilding