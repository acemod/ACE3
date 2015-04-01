/*
 * Author: esteldunedain
 *
 * Remove the line marker
 *
 * Argument:
 * 0: Marker Name (string)
 *
 * Return value:
 * Return
 */

#include "script_component.hpp"

 _name     = _this select 0;

 deleteMarkerLocal _name;
{
  if ((_x select 0) == _name) exitWith {
    GVAR(drawing_lineMarkers) = GVAR(drawing_lineMarkers) - [_x];
  };
} forEach GVAR(drawing_lineMarkers);

if (isServer && GVAR(drawing_syncMarkers)) then {
  {
    if ((_x select 0) == _name) exitWith {
      GVAR(drawing_serverLineMarkers) = GVAR(drawing_serverLineMarkers) - [_x];
      publicVariable QGVAR(drawing_serverLineMarkers);
    };
  } forEach GVAR(drawing_serverLineMarkers);
};
