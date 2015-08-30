/*
 * Author: esteldunedain
 * Add the line marker
 *
 * Arguments:
 * 0: Marker Name <STRING>
 * 1: Marker start pos <ARRAY>
 * 2: Marker end pos <ARRAY>
 * 3: Color index <NUMBER>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_4(_name,_startPos,_endPos,_color);

private ["_marker", "_difPos", "_mag"];

_difPos = _endPos vectorDiff _startPos;

_marker = createMarkerLocal [_name, _startPos];
_name setMarkerShapeLocal "RECTANGLE";
_name setMarkerAlphaLocal 1;
_name setMarkerColorLocal _color;
_name setMarkerPosLocal (_startPos vectorAdd (_difPos vectorMultiply 0.5));
_mag = vectorMagnitude _difPos;
if (_mag > 0) then {
    _name setMarkerSizeLocal [5, _mag / 2];
    _name setMarkerDirLocal (180 + (_difPos select 0) atan2 (_difPos select 1) mod 360);
} else {
    _name setMarkerSizeLocal [5, 5];
    _name setMarkerDirLocal 0;
};

GVAR(drawing_lineMarkers) pushBack (+_this);

if (isServer && GVAR(drawing_syncMarkers)) then {
    GVAR(drawing_serverLineMarkers) pushBack (+_this);
    publicVariable QGVAR(drawing_serverLineMarkers);
};
