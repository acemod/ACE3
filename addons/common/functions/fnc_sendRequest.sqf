#include "script_component.hpp"
/*
 * Author: Glowbal
 * Send a request to an unit and execute code based upon results.
 *
 * Arguments:
 * 0: caller <OBJECT>
 * 1: target <OBJECT>
 * 2: requestID <STRING>
 * 3: requestMessage Will be localized for other target object. <STRING>
 * 4: callback Code called upon accept or decline. <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "ID", "Message", {callback}] call ace_common_fnc_sendRequest
 *
 * Public: Yes
 */

params ["_caller", "_target", "_requestID", "_requestMessage", "_callBack"];

if (isPlayer _target) then {
    // Pass request on to target locality for player accept/decline.
    [QGVAR(receiveRequest), [_caller, _target, _requestID, _requestMessage, _callBack], _target] call CBA_fnc_targetEvent;
} else {
    // accept it, since it's an AI.
    [_caller, _target, true] call compile _callBack;
};
