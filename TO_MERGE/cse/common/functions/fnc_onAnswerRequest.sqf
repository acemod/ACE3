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

private ["_unit","_requestID", "_id", "_accepted", "_info", "_callBack", "_caller", "_replyParams", "_requestMessage", "_target"];
_unit = _this select 0;
_id = _this select 1;
_accepted = _this select 2;

_info = _unit getvariable _id;
if (!isnil "_info") then {
	_caller = _info select 0;
	_target = _info select 1;
	_requestID = _info select 2;
	_requestMessage = _info select 3;
	_callBack = _info select 4;
	_replyParams = [_info, _accepted];
	[_replyParams, QUOTE(FUNC(requestCallback)), _caller, false] spawn BIS_fnc_MP;
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
