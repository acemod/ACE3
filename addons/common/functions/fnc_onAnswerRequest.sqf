/**
 * fn_onAnswerRequest.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

private ["_requestID", "_info", "_callBack", "_caller", "_replyParams", "_requestMessage", "_target"];

PARAMS_3(_unit,_id,_accepted);

_info = _unit getvariable _id;
if (!isnil "_info") then {
    _caller = _info select 0;
    _target = _info select 1;
    _requestID = _info select 2;
    _requestMessage = _info select 3;
    _callBack = _info select 4;
    _replyParams = [_info, _accepted];
    [_replyParams, QFUNC(requestCallback), _caller, false] call FUNC(execRemoteFnc);
    _unit setvariable [_id, nil];
};

GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = nil;

if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
    _unit removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
};
if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
    _unit removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
};
