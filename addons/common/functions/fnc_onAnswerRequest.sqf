/*
 * Author: Glowbal
 * N/A
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_id", "_accepted"];

private _info = _unit getVariable _id;

if (!isNil "_info") then {
    _info params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

    private _replyParams = [_info, _accepted];
    [_replyParams, QFUNC(requestCallback), _caller, false] call FUNC(execRemoteFnc);
    _unit setVariable [_id, nil];
};

GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = nil;

if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
    _unit removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
};
if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
    _unit removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
};
