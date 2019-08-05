#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Associates unit and weapon holder on death and moves weapon on back into
 * the dropped weapon holder.
 *
 * Arguments:
 * 0: Weapon holder <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_weaponHolder"];

private _unit = nearestObject [_weaponHolder, "CAManBase"];
if (isNull _unit || {alive _unit}) exitWith {};

_unit setVariable [QGVAR(droppedWeaponHolder), _weaponHolder];

if (local _unit && {_unit in GVAR(units)}) then {
    private _weaponsItems = [_unit] call FUNC(get);
    _weaponHolder addWeaponWithAttachmentsCargoGlobal [_weaponsItems, 1];

    [_unit] call FUNC(remove);
};
