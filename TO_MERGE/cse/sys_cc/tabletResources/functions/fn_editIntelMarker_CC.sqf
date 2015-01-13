
private ["_mpSync","_args","_nearest","_lastestCount","_pos","_count","_position"];
_position = [_this, 0, [0,0,0], [[]],3] call BIS_fnc_param;
_nearest = 25;
_lastestCount = -1;

_marker = [];
{
	_pos = (_x select 0);
	if ((_pos distance _position) < _nearest) then {
		_nearest = _pos distance _position;
		_lastestCount = _foreachIndex;
		_marker = _x;
	};
}foreach CSE_INTEL_MARKER_COLLECTION_CC;
if (_lastestCount < 0) exitwith {};
_selection = _marker select 4;
_usedDesc = _marker select 5;
_inputDesc = if (_usedDesc) then { _marker select 1 select 1;} else { "" };

_device = call cse_fnc_getCurrentDeviceName_CC;
[_device,"open","SALUTE Report",format["[_this,%1,'intel', ([([] call cse_fnc_getCurrentDeviceName_CC)] call cse_fnc_getDeviceSide_CC)] call cse_fnc_updateMarker_CC",_position]] call cse_fnc_setPopUpMenu_CC;

_opt = [
		["Type:","combo","",
		["Infantry","Motorized","Plane","Helicopter","Armor","Naval","HQ","Medical","Maintanance","Artillery","Mortar","Service","Recon","Mechanized","uav","Installation","Unknown"], _selection select 0
		],
		["Side:","combo","",["BLUFOR","OPFOR","GREENFOR","UNKNOWN"], _selection select 1],
		["direction:","combo","",["Static","North","North East","East","South East","South","South West","West","North West"], _selection select 2],
		["Size:","combo","",["Pax","Fire Team","Section","Platoon","Company","Battalion","Regiment", "Brigade"], _selection select 3],
		["","combo","",["1x","2x","3x","4x","5x","6x", "7x"], _selection select 4],
		["Description:","input",_inputDesc]
	];
[_device,_opt] call cse_fnc_setPopUpOptions_CC;

cse_fnc_updateMarker_CC = {
	[CSE_CLICKED_ON_MAP_FOUND_INTELMARKER_CC] call cse_fnc_removeIntelMarker_CC;
	_this call cse_fnc_placeMarker_CC;
};
