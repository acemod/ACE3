#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Recieves the data packet from the vector rangefinder
 *
 * Arguments:
 * 0: Slope distance (Meters) <NUMBER>
 * 1: Azimuth (Degrees) <NUMBER>
 * 2: Inclination (Degrees) <NUMBER>
 * 3: Azimuth Is Magnetic <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [1000, 45, 1] call ace_microdagr_fnc_recieveRangefinderData
 *
 * Public: No
 */
params ["_slopeDistance", "_azimuth", "_inclination", ["_isMagnetic", false]];

if (GVAR(currentWaypoint) != -2) exitWith {}; //Only take waypoint when "connected"
if (_slopeDistance < 0) exitWith {}; //Bad Data

if (_isMagnetic) then { 
    // We know we are getting a simple magnetic reading from a "dumb" device, convert to true heading
    _azimuth = _azimuth - (missionNamespace getVariable [QEGVAR(common,magneticDeclinationOffset), 0]);
};

private _horizontalDistance = (cos _inclination) * _slopeDistance;
private _verticleDistance = (sin _inclination) * _slopeDistance;

private _targetOffset = [((sin _azimuth) * _horizontalDistance), ((cos _azimuth) * _horizontalDistance), _verticleDistance];
//This assumes the "rangefinder view" pos is very close to player, at worst the turret should only be a few meters different
private _targetPosASL = (getPosASL ACE_player) vectorAdd _targetOffset;

GVAR(rangeFinderPositionASL) = _targetPosASL;
