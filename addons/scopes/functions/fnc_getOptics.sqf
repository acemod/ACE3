/*
 * Author: commy2
 * Gets the optic classnames of all currently equipped weapons.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * 0: Optic of primary <STRING>
 * 1: Optic of secondary <STRING>
 * 2: Optic of handgun <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_unit);

private ["_array"];
_array = ["", "", ""];

if !(_unit isKindOf "CAManBase") exitWith {_array};

{
    if (count _x >= 2) then {
        _array set [_forEachIndex, _x select 2];
    };
} forEach [primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit];

_array
