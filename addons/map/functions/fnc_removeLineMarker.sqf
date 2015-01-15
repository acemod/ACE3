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
    GVAR(lineMarkers) = GVAR(lineMarkers) - [_x];
  };
} forEach GVAR(lineMarkers);

if (isServer && GVAR(syncMarkers)) then {
  {
    if ((_x select 0) == _name) exitWith {
      GVAR(serverLineMarkers) = GVAR(serverLineMarkers) - [_x];
      publicVariable "GVAR(serverLineMarkers)";
    };
  } forEach GVAR(serverLineMarkers);
};
