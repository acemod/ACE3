/*
 * Author: CAA-Picard
 *
 * Add the line marker
 *
 * Argument:
 * 0: Marker Name (string)
 * 1: Marker start pos (array)
 * 2: Marker end pos (array)
 * 3: Color index (Number)
 *
 * Return value:
 * Return
 */

 _name     = _this select 0;
 _startPos = _this select 1;
 _difPos   = (_this select 2) vectorDiff _startPos ;
 _color    = _this select 3;

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

AGM_Map_lineMarkers pushBack (+_this);

if (isServer && AGM_Map_syncMarkers) then {
  AGM_Map_serverLineMarkers pushBack (+_this);
  publicVariable "AGM_Map_serverLineMarkers";
};
