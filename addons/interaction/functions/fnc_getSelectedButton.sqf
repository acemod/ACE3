/*
 * Author: commy2
 * Get selected button
 *
 * Arguments:
 * None
 *
 * Return value:
 * Angle <NUMBER>
 *
 * Example:
 * _number = call ace_interaction_fnc_getSelectedButton
 *
 * Public: No
 */
#include "script_component.hpp"

#define MIN_DISTANCE 0.0065

private ["_position", "_distance", "_angle"];

_position = uiNamespace getVariable [QGVAR(CursorPosition), [0.5, 0.5, 0]];

_position = [((_position select 1) - 0.5) / safezoneH, ((_position select 2) - 0.5) / safezoneW, 0];

_distance = [0, 0, 0] vectorDistanceSqr _position;

// is in center
if (_distance < MIN_DISTANCE) exitWith {-1};

_angle = (_position select 0) atan2 (_position select 1);

// rotate circle
_angle = 180 - _angle + 360 / 10 / 2;
if (_angle < 0) then {_angle = _angle + 360};

_angle = floor (_angle / 360 * 10);
if (_angle == 10) then {0} else {_angle}
