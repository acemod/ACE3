#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Restores vanilla fuel cargo when refuel vehicle is destroyed.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_refuel_fnc_handleDamage
 *
 * Public: No
 */

params ["_source", "", "_damage"];

// run only once when destroyed
if (
    !alive _source
    || {_damage < 1}
    || {_source getVariable [QGVAR(handled), false]}
) exitWith {};
_source setVariable [QGVAR(handled), true];

// burn time does not depend on amount so just check if > 0
private _amount = _source getVariable [QGVAR(currentFuelCargo), 1];

TRACE_5("hd",_source,_amount,damage _source,_damage,local _source);

if (_amount > 0) then {_source setFuelCargo 1};
