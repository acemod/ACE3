/**
 * fn_recieveRequest.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

PARAMS_5(_caller,_target,_requestID,_requestMessage,_callBack);

_requestID = ("ace_recieveRequest_f_id_"+_requestID);

_target setvariable [_requestID, _this];

if (isLocalized _requestMessage) then {
    _requestMessage = format[localize _requestMessage,[_caller] call FUNC(getName)];
} else {
    _requestMessage = format[_requestMessage,[_caller] call FUNC(getName)];
};

hint format["%1",_requestMessage];
if !(isnil QGVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT)) then {
    terminate GVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT);
};

if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
    _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
};
if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
    _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
};

GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = _target addAction ["Accept", compile format["[player,'%1', true] call FUNC(onAnswerRequest);", _requestID]];
GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = _target addAction ["Decline", compile format["[player,'%1', false] call FUNC(onAnswerRequest);", _requestID]];

GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = _requestID;

GVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT) = [time, _target, _requestID] spawn {
    _t = (_this select 0) + 40;
    _target = _this select 1;
    _requestID = _this select 2;
    _id = _target getvariable _requestID;
    waituntil {
        _id = _target getvariable _requestID;

    (time > _t || isnil "_id")};
    _target setvariable [_requestID, nil];
    GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = nil;
    if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
        _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
        GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
    };
    if (!isnil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
        _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
        GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
    };
};