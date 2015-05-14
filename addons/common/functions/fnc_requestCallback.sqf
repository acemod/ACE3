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
PARAMS_2(_info,_accepted);

_caller = _info select 0;
_target = _info select 1;
_requestID = _info select 2;
_requestMessage = _info select 3;
_callBack = _info select 4;

[_caller, _target, _accepted] call compile _callBack;