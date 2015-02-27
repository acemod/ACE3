/*
 * Author: PabstMirror
 * Starts the disarming process from the caller
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: error message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_caller,_target,_errorMsg);

if (_caller != ACE_player) exitWith {};

systemChat format ["Debug-Caller: Disarm finished from [%1] with code [%2]", _target, _errorMsg];
