//CAA-Picard
//update gps display

#include "script_component.hpp"

if ((!("ItemGPS" in assigneditems ACE_player)) || {isNull (uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull])}) exitWith {
	("RscACE_MapGps" call BIS_fnc_rscLayer) cutText ["","PLAIN"];  //close GPS RSC
	[(_this select 1)] call CBA_fnc_removePerFrameHandler;  //remove frameHandler
};
disableSerialization;

_mapGpsDisplay = uiNamespace getVariable [QGVAR(ui_mapGpsDisplay), displayNull];
_ctrl = _mapGpsDisplay displayCtrl 913590;
_ctrl ctrlSetText str(round(getDir player));  //set Heading 
_ctrl = _mapGpsDisplay displayCtrl 913591;
_ctrl ctrlSetText str(round((getPosASL player) select 2)); //set Altitude
_ctrl = _mapGpsDisplay displayCtrl 913592;
_ctrl ctrlSetText mapGridPosition player; //set grid cords
