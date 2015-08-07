/*
 * Author: Glowbal
 *
 * N/A
 *
 * Argument:
 * ?
 *
 * Return value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_info", "_accepted"];
_info params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

[_caller, _target, _accepted] call compile _callBack;
