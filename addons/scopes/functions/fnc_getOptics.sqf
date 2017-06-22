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
 * Example:
 * [player] call ace_scopes_fnc_getOptics
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _optics = ["", "", ""];

if (!(_unit isKindOf "CAManBase")) exitWith {_optics};

{
    if (count _x >= 2) then {
        _optics set [_forEachIndex, _x select 2];
    };
} forEach [primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit];

_optics
