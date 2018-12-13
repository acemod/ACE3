#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Opens or closes the gps on the map screen, showing coordinates
 *
 * Arguments:
 * 0: Open GPS? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ACE_maptools_fnc_openMapGps
 *
 * Public: No
 */

params ["_shouldOpenGps"];

private _isOpen = !(isNull (uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull]));

if (_shouldOpenGps && {"ItemGPS" in assignedItems ACE_player} && {!_isOpen}) then {
    ("RscACE_MapGps" call BIS_fnc_rscLayer) cutRsc ["RscACE_MapGps","PLAIN"];

    [FUNC(openMapGpsUpdate), 0.5, []] call CBA_fnc_addPerFrameHandler;  //update bearing/altitude every 0.5 sec (ticktime)
} else {
    ("RscACE_MapGps" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};
