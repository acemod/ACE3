/**
 * fn_recieveRequest.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];
_caller = _this select 0;
_target = _this select 1;
_requestID = _this select 2;
_requestMessage = _this select 3;
_callBack = _this select 4;

_requestID = ("cse_fnc_recieveRequest_f"+_requestID);

_target setvariable [_requestID, _this];

if (isLocalized _requestMessage) then {
	_requestMessage = format[localize _requestMessage,[_caller] call cse_fnc_getName];
} else {
	_requestMessage = format[_requestMessage,[_caller] call cse_fnc_getName];
};

hint format["%1",_requestMessage];
if !(isnil "CSE_RECIEVE_REQUEST_TIME_OUT_SCRIPT") then {
	terminate CSE_RECIEVE_REQUEST_TIME_OUT_SCRIPT;
};

if (!isnil "CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT") then {
	_target removeAction CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT;
	CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT = nil;
};
if (!isnil "CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE") then {
	_target removeAction CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE;
	CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE = nil;
};

CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT = _target addAction ["Accept", compile format["[player,'%1', true] call cse_fnc_onAnswerRequest;", _requestID]];
CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE = _target addAction ["Decline", compile format["[player,'%1', false] call cse_fnc_onAnswerRequest;", _requestID]];

CSE_RECIEVE_REQUEST_ID_KEY_BINDING = _requestID;

CSE_RECIEVE_REQUEST_TIME_OUT_SCRIPT = [time, _target, _requestID] spawn {
	_t = (_this select 0) + 40;
	_target = _this select 1;
	_requestID = _this select 2;
	_id = _target getvariable _requestID;
	waituntil {
		_id = _target getvariable _requestID;

	(time > _t || isnil "_id")};
	_target setvariable [_requestID, nil];
	CSE_RECIEVE_REQUEST_ID_KEY_BINDING = nil;
	if (!isnil "CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT") then {
		_target removeAction CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT;
		CSE_RECIEVE_REQUEST_ADD_ACTION_ACCEPT = nil;
	};
	if (!isnil "CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE") then {
		_target removeAction CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE;
		CSE_RECIEVE_REQUEST_ADD_ACTION_DECLINE = nil;
	};

};