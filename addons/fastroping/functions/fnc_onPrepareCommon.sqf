/*
 * Author: BaerMitUmlaut
 * Function for closing doors and retracting the hook for most vanilla helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_onDeployRopesCommon
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_fries", "_waitTime"];

_waitTime = 2;

_vehicle animateDoor ["door_R", 1];
_vehicle animateDoor ["door_L", 1];
_vehicle animateDoor ["CargoRamp_Open", 1];
_vehicle animateDoor ["Door_rear_source", 1];
_vehicle animateDoor ["Door_6_source", 1];
_vehicle animate ["dvere1_posunZ", 1];
_vehicle animate ["dvere2_posunZ", 1];

_vehicle setVariable [QGVAR(doorsLocked), true, true];

_fries = _vehicle getVariable [QGVAR(FRIES), objNull];
if !(isNull _fries) then {
    [{
        _this animate ["extendHookRight", 1];
        _this animate ["extendHookLeft", 1];
    }, _fries, 2] call CBA_fnc_waitAndExecute;
    _waitTime = 4;
};

_waitTime
