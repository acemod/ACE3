#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Restores vanilla fuel cargo when refuel vehicle is destroyed.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * nil
 *
 * Example:
 * call ace_refuel_fnc_handleDamage
 *
 * Public: No
 */

params ["_source", "_selection", "_damage"];

if (
    !alive _source
    || {_selection isNotEqualTo ""} // overall structural damage
    || {_damage < 1}
    || {_source getVariable [QGVAR(handled), false]}
) exitWith {};

_source setVariable [QGVAR(handled), true];

// burn time does not depend on amount so just check if > 0
private _amount = _source getVariable [QGVAR(currentFuelCargo), 1];

TRACE_5("hd",_source,_amount,damage _source,_damage,local _source);

if (_amount > 0) then {_source setFuelCargo 1};

// handle other HandleDamage systems
[{
    params ["_source"];
    if (!alive _source) exitWith {};
    TRACE_1("still alive",_source);

    if (getFuelCargo _source > 0) then {
        // in case of locality change
        [QGVAR(setFuelCargo), [_source, 0], _source] call CBA_fnc_targetEvent;
    };

    _source setVariable [QGVAR(handled), false];
}, _source, 1] call CBA_fnc_waitAndExecute;

nil
