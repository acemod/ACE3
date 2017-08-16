/*
 * Author: Dystopian
 * Mouse button down event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_refuel_fnc_onMouseButtonDown
 *
 * Public: No
 */
#include "script_component.hpp"

private _button = _this select 1;
private _unit = ACE_player;
private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];

if (_button > 1 || {isNull _nozzle}) exitWith {};

getCursorObjectParams params ["_cursorObject", "", "_distance"];

// RMB
if (_button == 1) exitWith {
    if (
        !isNull _cursorObject
        && {_distance < REFUEL_NOZZLE_ACTION_DISTANCE}
        && {[_unit, _cursorObject] call FUNC(canReturnNozzle)}
    ) then {
        [_unit, _cursorObject] call FUNC(returnNozzle);
    } else {
        [_unit, _nozzle] call FUNC(dropNozzle);
    };
};

// LMB
// code from attach, don't know what it is
private _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]);
if (cameraView == "EXTERNAL") then {
    _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
};
if (
    !isNull _cursorObject
    && {_distance < REFUEL_NOZZLE_ACTION_DISTANCE}
    && {1 == getNumber (configFile >> "CfgVehicles" >> (typeOf _cursorObject) >> QGVAR(canReceive))}
    && {isNull (_cursorObject getVariable [QGVAR(nozzle), objNull])}
    && {!lineIntersects [eyePos _unit, _virtualPosASL, _unit]}
) then {
    [_unit, _cursorObject, _virtualPosASL, _nozzle] call FUNC(connectNozzleAction);
};
