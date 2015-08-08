/*
 * Author: Glowbal
 *
 * Send a request to an unit and execute code based upon results.
 *
 * Arguments:
 * 0: caller <OBJECT>
 * 1: target <OBJECT>
 * 2: requestID (STRING)
 * 3: requestMessage Will be localized for other target object. (STRING)
 * 4: callback Code called upon accept or decline. (CODE)
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target", "", "", "_callBack"];

if (isPlayer _target) then {
    // Pass request on to target locality for player accept/decline.
    [_this, QFUNC(receiveRequest), _target, false] call EFUNC(common,execRemoteFnc);
} else {
    // accept it, since it's an AI.
    [_caller, _target, true] call compile _callBack;
};
