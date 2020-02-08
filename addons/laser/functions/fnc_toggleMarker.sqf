#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles the marker laser mode for any laser-designating vehicle;
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_toggleMarker
 *
 * Public: No
 */
 

params ["_vehicle"];

_hasMarker = _vehicle getVariable [QGVAR(hasMarkerLaser), false];
if (! _hasMarker) exitWith {};

private _enabled = _vehicle getVariable [QGVAR(laserMarkerOn), false];
_vehicle setVariable [QGVAR(laserMarkerOn), !_enabled];

private _markerMessage = if(_vehicle getVariable [QGVAR(laserMarkerOn), false]) then {localize LSTRING(LaserMarkOn)} else {localize LSTRING(LaserMarkOff)};
[_markerMessage] call EFUNC(common,displayTextStructured);

GVAR(TrackerpfID) = [{
    params ["_args", "_pfID"];
    _args params ["_vehicle"];

    private _lightpoints = _vehicle getVariable [QGVAR(markerlightpoints), []];
    {
        deleteVehicle _x;
    } forEach _lightpoints;
    _vehicle setVariable [QGVAR(markerlightpoints), []];

    if ( !(_vehicle getVariable [QGVAR(laserMarkerOn), false]) || !(alive _vehicle) ) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    if (isNull (laserTarget _vehicle)) exitWith {};

    private _laserSource = _vehicle modelToWorldWorld [0,0,0];
    if (hasPilotCamera _vehicle) then {
        _pilotCameraPos = getPilotCameraPosition _vehicle;
        _laserSource = AGLToASL (_vehicle modelToWorld _pilotCameraPos);
    };

    private _laserPos = getPosASL (laserTarget _vehicle);
    private _distance = (_laserPos distance _laserSource) + 1.5;
    private _vector = _laserSource vectorFromTo _laserPos;
    
    private _num = 20;
    for "_i" from 1 to _num do {
        private _toPos = (_laserSource vectorAdd (_vector vectorMultiply _distance)) vectorAdd [sin(_i*(360/_num))*0.075,cos(_i*(360/_num))*0.075,0];
        [ASLToAGL (_laserSource), ASLToAGL (_toPos), [0.8,1,0.8,1]] remoteExec [QFUNC(drawLaserLine), 0, false];
    };

}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;


