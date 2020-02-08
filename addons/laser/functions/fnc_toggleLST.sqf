#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles the laser spot tracker for any enabled vehicle;
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

private _LSTmessage = if(_vehicle getVariable [QGVAR(laserSpotTrackerOn), false]) then {localize LSTRING(LSTOn)} else {localize LSTRING(LSTOff)};
private _string = format ["%1<br/>", _LSTmessage];
private _laserCode =_vehicle getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
_string = format ["%1%2: %3<br/>",_string, localize LSTRING(laserCode), _laserCode];
[_string] call EFUNC(common,displayTextStructured);

GVAR(TrackerpfID) = [{
    params ["_args", "_pfID"];
    _args params ["_vehicle"];

    if (!(_vehicle getVariable [QGVAR(laserSpotTrackerOn), false]) || (!alive _vehicle)) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    
    if((getPilotCameraTarget _vehicle) select 0) exitWith {};
    private _pos = _vehicle modelToWorldWorld [0,0,0];
    
    private _pilotCameraPos = getPilotCameraPosition _vehicle;
    private _pilotCameraRotation = getPilotCameraRotation _vehicle;
    private _laserCode = _vehicle getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
    
    private _pilotCameraLookPos = [sin(-deg(_pilotCameraRotation select 0)) * cos(-deg(_pilotCameraRotation select 1)), cos(-deg(_pilotCameraRotation select 0)) * cos(-deg(_pilotCameraRotation select 1)), sin(-deg(_pilotCameraRotation select 1))];
    private _pilotCameraVector = _pos vectorFromTo (_vehicle modelToWorldWorld _pilotCameraLookPos);

    private _laserSource = _vehicle modelToWorldWorld _pilotCameraPos;
    
    private _laserResult = [_laserSource, _pilotCameraVector, 15, 5000, [ACE_DEFAULT_LASER_WAVELENGTH,ACE_DEFAULT_LASER_WAVELENGTH], _laserCode, _vehicle] call EFUNC(laser,seekerFindLaserSpot);
    private _foundTargetPos = _laserResult select 0;

    if((getPilotCameraTarget _vehicle) select 0) then {
        private _distance = ((getPilotCameraTarget _vehicle) select 1) distance _foundTargetPos;
        if(_distance > 0.5) then {
            _vehicle setPilotCameraTarget _foundTargetPos;
        };
    } else {
        _vehicle setPilotCameraTarget _foundTargetPos;
    };
}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;


