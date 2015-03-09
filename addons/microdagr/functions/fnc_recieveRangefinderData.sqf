/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

PARAMS_3(_slopeDistance,_azimuth,_inclination);

if (GVAR(currentWaypoint) != -2) exitWith {}; //Only take waypoint when "connected"
if (_slopeDistance < 0) exitWith {}; //Bad Data

_horizontalDistance = (cos _inclination) * _slopeDistance;
_verticleDistance = (sin _inclination) * _slopeDistance;

_targetOffset = [((sin _azimuth) * _horizontalDistance), ((cos _azimuth) * _horizontalDistance), _verticleDistance];
//This assumes the "rangefinder view" pos is very close to player, at worst the turret should only be a few meters different
_targetPosASL = (getPosASL ace_player) vectorAdd _targetOffset;

GVAR(rangeFinderPositionASL) = _targetPosASL;
