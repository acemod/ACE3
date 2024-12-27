#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles the laser spot tracker for any enabled vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_toggleLST
 *
 * Public: No
 */


params ["_vehicle"];

if !(_vehicle getVariable [QGVAR(hasLaserSpotTracker), false]) exitWith {};

private _enabled = _vehicle getVariable [QGVAR(laserSpotTrackerOn), false];
_vehicle setVariable [QGVAR(laserSpotTrackerOn), !_enabled];

private _LSTmessage = if (_vehicle getVariable [QGVAR(laserSpotTrackerOn), false]) then {localize LSTRING(LSTOn)} else {localize LSTRING(LSTOff)};
private _string = format ["%1<br/>", _LSTmessage];
private _laserCode = _vehicle getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
_string = format ["%1%2: %3<br/>",_string, localize LSTRING(laserCode), _laserCode];
[_string] call EFUNC(common,displayTextStructured);

if (_enabled) exitWith {};

[{
    params ["_args", "_pfhID"];
    _args params ["_vehicle"];

    if !(_vehicle getVariable [QGVAR(laserSpotTrackerOn), false] && {alive _vehicle}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };

    private _laserCode = _vehicle getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
    private _angle = 25;

    private _pos = _vehicle modelToWorldVisualWorld [0,0,0];
    private _pilotCameraPos = getPilotCameraPosition _vehicle;
    private _pilotCameraVector = _pos vectorFromTo (_vehicle modelToWorldVisualWorld (getPilotCameraDirection _vehicle));

    (getPilotCameraTarget _vehicle) params ["_isTracking", "_spotPos"];

    if (_isTracking) then {
        _angle = 0.25;
    };

    private _laserSource = _vehicle modelToWorldWorld _pilotCameraPos;
    private _laserResult = [_laserSource, _pilotCameraVector, _angle, 5000, [ACE_DEFAULT_LASER_WAVELENGTH,ACE_DEFAULT_LASER_WAVELENGTH], _laserCode, _vehicle, laserTarget _vehicle, [_vehicle]] call FUNC(seekerFindLaserSpot);
    private _foundTargetPos = _laserResult select 0;

    if (_isTracking) then {
        private _distance = _spotPos distance _foundTargetPos;
        if (_distance > 0.75) then {
            _vehicle setPilotCameraTarget _foundTargetPos;
        };
    } else {
        _vehicle setPilotCameraTarget _foundTargetPos;
    };
}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;
