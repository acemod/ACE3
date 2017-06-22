/*
 * Author: BaerMitUmlaut
 * Function for opening doors and extending the hook for most vanilla helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_onCutRopesCommon
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

private _fries = _vehicle getVariable [QGVAR(FRIES), objNull];
if !(isNull _fries) then {
    _fries animate ["extendHookRight", 0];
    _fries animate ["extendHookLeft", 0];
    [{
        _this animateDoor ["door_R", 0];
        _this animateDoor ["door_L", 0];
        _this animateDoor ["CargoRamp_Open", 0];
        _this animateDoor ["Door_rear_source", 0];
        _this animateDoor ["Door_6_source", 0];
        _this animate ["dvere1_posunZ", 0];
        _this animate ["dvere2_posunZ", 0];
        _this setVariable [QGVAR(doorsLocked), false, true];
    }, _vehicle, 2] call CBA_fnc_waitAndExecute;

    4
} else {
    _vehicle animateDoor ["door_R", 0];
    _vehicle animateDoor ["door_L", 0];
    _vehicle animateDoor ["CargoRamp_Open", 0];
    _vehicle animateDoor ["Door_rear_source", 0];
    _vehicle animateDoor ["Door_6_source", 0];
    _vehicle animate ["dvere1_posunZ", 0];
    _vehicle animate ["dvere2_posunZ", 0];
    _vehicle setVariable [QGVAR(doorsLocked), false, true];

    2
};
