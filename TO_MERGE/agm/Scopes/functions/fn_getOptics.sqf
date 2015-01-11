/*
 * Author: commy2
 *
 * Gets the optic classnames of all currently equipped weapons.
 *
 * Arguments:
 * 0: Unit (Object)
 *
 * Return Value:
 * [optic of primary, optic of secondary, optic of handgun] (Array)
 */

private ["_unit", "_array"];

_unit = _this select 0;

_array = ["", "", ""];

if !(_unit isKindOf "CAManBase") exitWith {_array};

{
	if (count _x >= 2) then {
		_array set [_forEachIndex, _x select 2];
	};
} forEach [primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit];

_array
