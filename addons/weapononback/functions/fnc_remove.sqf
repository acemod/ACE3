#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Removes the weapon on the back of a unit (global effect).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_weapononback_fnc_remove
 *
 * Public: Yes
 */
params ["_unit", ["_calledFromEvent", false]];

if !(_unit in GVAR(units)) exitWith {};

if (!_calledFromEvent) exitWith {
    [EVENT_ID(_unit)] call CBA_fnc_removeGlobalEventJIP;
    [QGVAR(remove), [_unit]] call CBA_fnc_globalEvent;
};

private _weaponHolder = _unit getVariable [QGVAR(weaponHolder), objNull];
deleteVehicle _weaponHolder;

// There is a delay when deleting the weapon holder, so ensure the variable is null
_unit setVariable [QGVAR(weaponHolder), objNull];
GVAR(units) deleteAt (GVAR(units) find _unit);

if (local _unit) then {
    private _oldMass = _unit getVariable [QGVAR(weaponMass), 0];
    [_unit, _unit, -_oldMass] call EFUNC(movement,addLoadToUnitContainer);
    _unit setVariable [QGVAR(weaponMass), 0, true];

    _unit removeWeapon QGVAR(weapon);
    [] call FUNC(updateInventory);
};
