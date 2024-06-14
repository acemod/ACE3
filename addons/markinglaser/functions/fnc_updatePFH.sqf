#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Sends network updates for all local marking lasers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_markinglaser_fnc_updatePFH
 *
 * Public: No
 */

if (GVAR(localLasers) isEqualTo []) exitWith {};

{
    private _aircraft = _x;
    (getPilotCameraTarget _aircraft) params ["_isTracking", "_targetPos", "_targetObj"];

    private ["_type", "_target"];
    switch (true) do {
        case (_isTracking && {!isNull _targetObj}): {
            _type = TYPE_OBJECT;
            _target = _targetObj;
        };
        case (_isTracking): {
            _type = TYPE_GROUND;
            _target = _targetPos;
        };
        default {
            _type = TYPE_VECTOR;
            _target = getPilotCameraDirection _aircraft;
        };
    };

    _aircraft setVariable [QGVAR(laser), [_type, _target, CBA_missionTime], true];
} forEach GVAR(localLasers);
