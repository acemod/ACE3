/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_caller,_target);
DEFAULT_PARAM(2,_type,"");

if (false) exitWith {false};

_returnValue = true;

switch (_type) do {


};

_returnValue
