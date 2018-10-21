#include "script_component.hpp"
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

private _distance = call FUNC(getDistance);
private _direction = call FUNC(getDirection);
_direction params ["_azimuth", "_inclination"];

//Send Data to connected GPS
[QGVAR(rangefinderData), [_distance, _azimuth, _inclination]] call CBA_fnc_localEvent;
