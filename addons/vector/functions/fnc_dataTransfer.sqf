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

private _distance = call FUNC(getDistance);
private _direction = call FUNC(getDirection);
private _azimuth = _direction select 0;
private _inclination = _direction select 1;
//Send Data to connected GPS
[QGVAR(rangefinderData), [_distance, _azimuth, _inclination]] call CBA_fnc_localEvent;
