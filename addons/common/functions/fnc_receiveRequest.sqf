#include "script_component.hpp"
/*
 * Author: Glowbal
 * N/A
 *
 * Arguments:
 * 0: caller <OBJECT>
 * 1: target <OBJECT>
 * 2: requestID <STRING>
 * 3: Message <STRING>
 * 4: callback (NOT USED) <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "ID", "Message", {Callback}] call ace_common_fnc_recieveRequest
 *
 * Public: No
 */

params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

_requestID = ("ace_recieveRequest_f_id_"+_requestID);

_target setVariable [_requestID, _this];

if (isLocalized _requestMessage) then {
    _requestMessage = format [localize _requestMessage, [_caller, false, true] call FUNC(getName)];
} else {
    _requestMessage = format [_requestMessage, [_caller, false, true] call FUNC(getName)];
};

hint format ["%1", _requestMessage]; // @todo ?

if (!isNil QGVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT)) then {
    terminate GVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT);
};

if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
    _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
};

if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
    _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
    GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
};

GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = _target addAction ["Accept", compile format["[player,'%1', true] call FUNC(onAnswerRequest);", _requestID]];
GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = _target addAction ["Decline", compile format["[player,'%1', false] call FUNC(onAnswerRequest);", _requestID]];

GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = _requestID;

GVAR(RECIEVE_REQUEST_TIME_OUT_SCRIPT) = [CBA_missionTime, _target, _requestID] spawn { // @todo
    params ["_time", "_target", "_requestID"];

    _time = _time + 40;

    private _id = _target getVariable _requestID;

    waitUntil {
        _id = _target getVariable _requestID;

        (CBA_missionTime > _time || isNil "_id")
    };

    _target setVariable [_requestID, nil];

    GVAR(RECIEVE_REQUEST_ID_KEY_BINDING) = nil;

    if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT)) then {
        _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT);
        GVAR(RECIEVE_REQUEST_ADD_ACTION_ACCEPT) = nil;
    };

    if (!isNil QGVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE)) then {
        _target removeAction GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE);
        GVAR(RECIEVE_REQUEST_ADD_ACTION_DECLINE) = nil;
    };
};
