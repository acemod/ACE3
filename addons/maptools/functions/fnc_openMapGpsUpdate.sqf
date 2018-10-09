#include "script_component.hpp"
/*
 * Author: esteldunedain
 * update gps display
 *
 * Arguments:
 * Something
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_maptools_fnc_openMapGpsUpdate
 *
 * Public: No
 */

if ((!("ItemGPS" in assigneditems ACE_player)) || {isNull (uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull])}) exitWith {
    ("RscACE_MapGps" call BIS_fnc_rscLayer) cutText ["","PLAIN"];  // Close GPS RSC
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;  // Remove frameHandler
};
disableSerialization;

private _mapGpsDisplay = uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull];
private _ctrl = _mapGpsDisplay displayCtrl 913590;
_ctrl ctrlSetText str (round (getDir ACE_player));  // Set Heading
_ctrl = _mapGpsDisplay displayCtrl 913591;
_ctrl ctrlSetText str (round ((getPosASL ACE_player) select 2) + EGVAR(common,mapAltitude)); // Set Altitude
_ctrl = _mapGpsDisplay displayCtrl 913592;
_ctrl ctrlSetText mapGridPosition ACE_player; // Set grid cords
