/*
 * Author: esteldunedain
 * Updates the line marker position and scale
 *
 * Arguments:
 * 0: Marker Name <STRING>
 * 1: Marker start pos <ARRAY>
 * 2: Marker end pos <ARRAY>
 * 3: Color index <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_4(_name,_startPos,_endPos,_color);

private ["_difPos", "_mag"];

_difPos = _endPos vectorDiff _startPos;

_name setMarkerShapeLocal "RECTANGLE";
_name setMarkerAlphaLocal 1;
_name setMarkerColorLocal GVAR(drawing_drawColor);
_name setMarkerPosLocal (_startPos vectorAdd (_difPos vectorMultiply 0.5));
_mag = vectorMagnitude _difPos;
if (_mag > 0) then {
    _name setMarkerSizeLocal [5, _mag / 2];
    _name setMarkerDirLocal (180 + (_difPos select 0) atan2 (_difPos select 1) mod 360);
} else {
    _name setMarkerSizeLocal [5, 5];
    _name setMarkerDirLocal 0;
};
