#include "..\script_component.hpp"
/*
 * Author: esteldunedain, PabstMirror
 * Update GPS display, called from main map's draw.
 *
 * Arguments:
 * 0: Map control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 12 displayCtrl 51] call ace_maptools_fnc_openMapGpsUpdate;
 *
 * Public: No
 */

params ["_mapCtrl"];

private _mapDisplay = ctrlParent _mapCtrl;

if (!GVAR(mapGpsShow) || {!(call FUNC(canUseMapGPS))}) exitWith {
    (_mapDisplay displayCtrl 913589) ctrlShow false;
};

(_mapDisplay displayCtrl 913589) ctrlShow true;

if (CBA_missionTime < GVAR(mapGpsNextUpdate)) exitWith {};

GVAR(mapGpsNextUpdate) = CBA_missionTime + 0.5;

private _ctrl = _mapDisplay displayCtrl 913590;
_ctrl ctrlSetText str (round ([ACE_player] call EFUNC(common,getMagneticBearing)));  // Set Heading

_ctrl = _mapDisplay displayCtrl 913591;
_ctrl ctrlSetText str (round ((getPosASL ACE_player) select 2) + EGVAR(common,mapAltitude)); // Set Altitude

_ctrl = _mapDisplay displayCtrl 913592;
_ctrl ctrlSetText mapGridPosition ACE_player; // Set grid cords
