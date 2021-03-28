#include "script_component.hpp"
/*
 * Author: Glowbal
 * N/A
 *
 * Arguments:
 * ? <UNKNOWN>
 *
 * Return Value:
 * ? <UNKNOWN>
 *
 * Example:
 * [bob] call ace_common_fnc_requestCallback
 *
 * Public: No
 */

params ["_info", "_accepted"];

_info params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

[_caller, _target, _accepted] call compile _callBack;
