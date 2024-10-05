#include "..\script_component.hpp"
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

params ["_unit"];

[primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit] apply {_x select 2} // return
