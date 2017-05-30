/*
 * Author: BaerMitUmlaut
 * Function for closing doors and retracting the hooks for RHS USF helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_rhs_usf3_fnc_onCut
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

_vehicle setVariable [QEGVAR(fastroping,doorsLocked), false, true];

private _fries = _vehicle getVariable [QEGVAR(fastroping,FRIES), objNull];
if !(isNull _fries) then {
    _fries animate ["extendHookRight", 0];
    _fries animate ["extendHookLeft", 0];
    [{
        _this animateDoor ["doorRB", 0];
        _this animateDoor ["doorLB", 0];
        _this animate ["doorHandler_R",0];
        _this animate ["doorHandler_L",0];
    }, _vehicle, 2] call CBA_fnc_waitAndExecute;

    4
} else {
    _vehicle animateDoor ["ramp_anim", 0];
    _vehicle animate ["ramp_bottom",0];
    _vehicle animate ["ramp_top",0];

    2
};
