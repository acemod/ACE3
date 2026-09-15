#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles laser point tracking when a laser is on, for tracking coordinates.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_laserPointTrack
 *
 * Public: No
 */
params ["_vehicle"];

[{
    params ["_args", "_pfhID"];
    _args params ["_vehicle"];
    if !(alive _vehicle && {local _vehicle} && {hasPilotCamera _vehicle} && {!isNull (laserTarget _vehicle)}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
    (getPilotCameraTarget _vehicle) params ["_isTracking", "_spotPos", "_targetObj"];
    if (!_isTracking) exitWith {};
    if (isNull _targetObj) then {
        private _laserTargetPos = getPosASL (laserTarget _vehicle);
        private _pilotCameraPos = _vehicle modelToWorldVisualWorld (getPilotCameraPosition _vehicle);
        private _pilotCameraVector = _pilotCameraPos vectorFromTo _laserTargetPos;
        private _laserDistance = _pilotCameraPos vectorDistance _laserTargetPos;
        private _spotDistance = _spotPos vectorDistance _laserTargetPos;
        if (_spotDistance > 3.5) then {
            private _vehPos = getPosASL _vehicle;
            private _vectorToLaser = _pilotCameraPos vectorFromTo _laserTargetPos;
            private _vectorToSpot = _pilotCameraPos vectorFromTo _spotPos;
            if (acos (_vectorToLaser vectorCos _vectorToSpot) < 0.015) then {
                _vehicle setPilotCameraTarget _laserTargetPos;
            };
        };
    };
}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;
