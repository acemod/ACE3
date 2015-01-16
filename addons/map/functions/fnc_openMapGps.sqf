/*
* Author: CAA-Picard
*
* Opens or closes the gps on the map screen, showing coordinates
*
* Argument:
* 0: Open GPS? (Boolean)
*
* Return value:
* Nothing
*/

#include "script_component.hpp"

_shouldOpenGps = _this select 0;
_isOpen = !(isNull (uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull]));

if (_shouldOpenGps && {"ItemGPS" in assignedItems ACE_player} && {!_isOpen}) then {
  ("RscACE_MapGps" call BIS_fnc_rscLayer) cutRsc ["RscACE_MapGps","PLAIN"];

  [FUNC(openMapGpsUpdate), 0.5, []] call CBA_fnc_addPerFrameHandler;  //update bearing/altitude every 0.5 sec (ticktime)
} else {
  ("RscACE_MapGps" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};

