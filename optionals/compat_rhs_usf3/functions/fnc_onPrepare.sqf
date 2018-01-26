/*
 * Author: BaerMitUmlaut
 * Function for opening doors and extending the hook for most vanilla helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_rhs_usf3_fnc_onPrepare
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

_vehicle setVariable [QEGVAR(fastroping,doorsLocked), true, true];

private _waitTime = 2;

_vehicle animateDoor ["doorRB", 1];
_vehicle animateDoor ["doorLB", 1];
_vehicle animate ["doorHandler_R",1];
_vehicle animate ["doorHandler_L",1];
_vehicle animateDoor ["ramp_anim", 1];
_vehicle animate ["ramp_bottom",0.56];
_vehicle animate ["ramp_top",1];

private _fries = _vehicle getVariable [QEGVAR(fastroping,FRIES), objNull];
if !(isNull _fries) then {
    [{
        _this animate ["extendHookRight", 1];
        _this animate ["extendHookLeft", 1];
    }, _fries, 2] call CBA_fnc_waitAndExecute;
    _waitTime = 4;
};

_waitTime
