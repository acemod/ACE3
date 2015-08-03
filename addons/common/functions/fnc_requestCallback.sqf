/**
 * fn_requestCallback.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];
params ["_info", "_accepted"];
_info params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

[_caller, _target, _accepted] call compile _callBack;
