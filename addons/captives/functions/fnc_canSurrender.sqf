/*
 * Author: PabstMirror
 * Checks the conditions for being able to surrender
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
#include "script_component.hpp"

PARAMS_2(_unit,_newSurrenderState);

private "_returnValue";

_returnValue = if (_newSurrenderState) then {
    !(_unit getVariable [QGVAR(isSurrendering), false]); //Not currently surrendering
} else {
    (_unit getVariable [QGVAR(isSurrendering), false]); //is Surrendering
};

_returnValue
