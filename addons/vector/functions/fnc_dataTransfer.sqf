/*
 * Author: PabstMirror
 * Data transfer over a connected cable. Based on page 14 of pdf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_vector_fnc_dataTransfer
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_distance", "_direction", "_azimuth", "_inclination"];

_distance = call FUNC(getDistance);
_direction = call FUNC(getDirection);
_azimuth = _direction select 0;
_inclination = _direction select 1;
//Send Data to connected GPS
[QGVAR(rangefinderData), [_distance, _azimuth, _inclination]] call CBA_fnc_localEvent;
