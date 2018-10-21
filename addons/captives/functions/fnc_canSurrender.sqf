#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Checks the conditions for being able switch surrender states
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: New Surrender State to test <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [Jean, true] call ACE_captives_fnc_canSurrender;
 *
 * Public: No
 */

params ["_unit", "_newSurrenderState"];

private _returnValue = if (_newSurrenderState) then {
    //no weapon equiped AND not currently surrendering and
    GVAR(allowSurrender) && {(currentWeapon _unit) == ""} && {!(_unit getVariable [QGVAR(isSurrendering), false])}
} else {
    //is Surrendering
    (_unit getVariable [QGVAR(isSurrendering), false])
};

_returnValue
