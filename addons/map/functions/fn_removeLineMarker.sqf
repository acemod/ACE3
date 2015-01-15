/*
 * Author: CAA-Picard
 *
 * Remove the line marker
 *
 * Argument:
 * 0: Marker Name (string)
 *
 * Return value:
 * Return
 */

 _name     = _this select 0;

 deleteMarkerLocal _name;
{
  if ((_x select 0) == _name) exitWith {
    AGM_Map_lineMarkers = AGM_Map_lineMarkers - [_x];
  };
} forEach AGM_Map_lineMarkers;

if (isServer && AGM_Map_syncMarkers) then {
  {
    if ((_x select 0) == _name) exitWith {
      AGM_Map_serverLineMarkers = AGM_Map_serverLineMarkers - [_x];
      publicVariable "AGM_Map_serverLineMarkers";
    };
  } forEach AGM_Map_serverLineMarkers;
};
