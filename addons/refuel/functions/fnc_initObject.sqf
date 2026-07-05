#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Initializes object with vanilla refuel.
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_refuel_fnc_initObject
 *
 * Public: No
 */

params ["_source"];

if (local _source && {getFuelCargo _source > 0}) then {
    _source setFuelCargo 0;
};

if (_source getVariable [QGVAR(HDEHID), -1] == -1) then {
    private _HDEHID = _source addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
    _source setVariable [QGVAR(HDEHID), _HDEHID];
};
