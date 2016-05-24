/*
 * Author: Glowbal
 * Handles an wound update request.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Origin object <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"
private ["_unit", "_openWounds", "_originOfrequest"];
params ["_unit", "_originOfrequest"];

if (local _unit && !(local _originOfrequest)) then {
    _openWounds = _unit getVariable [QGVAR(openWounds), []];
    {
        ["ace_medical_propagateWound", [_unit, _x], [_originOfrequest]] call CBA_fnc_targetEvent;
    } forEach _openWounds;
};
