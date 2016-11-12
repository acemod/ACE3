/*
 * Author: Jonpas
 * Drops nozzle or jerry can when selecting a weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING> (unused)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "gun"] call ace_refuel_fnc_handlePlayerWeaponChanged;
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

// Drop nozzle/jerry can when selecting a non-primary weapon
if (_unit getVariable [QGVAR(isRefueling), false]) then {
    private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
    if !(isNull _nozzle) then {
        [_unit, _nozzle] call FUNC(dropNozzle);
        _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
        [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
    };
};
