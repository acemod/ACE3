#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Returns the weapon on a units back.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Weapon, attachments and magazines (weaponsItems format) or empty array <ARRAY>
 *
 * Example:
 * [player] call ace_weapononback_fnc_get
 *
 * Public: Yes
 */
params ["_unit"];

private _weaponHolder = _unit getVariable [QGVAR(weaponHolder), objNull];

if (isNull _weaponHolder) then {
    []
} else {
    (weaponsItemsCargo _weaponHolder)#0
};
