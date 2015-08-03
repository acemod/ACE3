/**
 * fn_sendRequest_f.sqf
 * @Descr: Send a request to an unit and execute code based upon results.
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, target OBJECT, requestID STRING, requestMessage STRING (Will be localized for other target object), callback CODE (Code called upon accept or decline.)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

if (isPlayer _target) then {
    // Pass request on to target locality for player accept/decline.
    [[_caller, _target, _requestID, _requestMessage, _callBack], QUOTE(FUNC(receiveRequest)), _target, false] call EFUNC(common,execRemoteFnc);
} else {
    // accept it, since it's an AI.
    [_caller, _target, true] call compile _callBack;
};
