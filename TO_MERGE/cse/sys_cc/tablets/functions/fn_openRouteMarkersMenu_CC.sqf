/**
 * fn_openRouteMarkersMenu_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_device","_position"];
_device = _this select 0;
_position = _this select 1;

[_device,"open","Route Planning",format["[_this,%1,'route', ([([] call cse_fnc_getCurrentDeviceName_CC)] call cse_fnc_getDeviceSide_CC)] call cse_fnc_placeMarker_CC",_position]] call cse_fnc_setPopUpMenu_CC;

if (isnil "_layerNames") then {
	_layerNames = [];
};
_opt = [
		["Type:","combo","",["Dot","Waypoint","ReOrg","Crossing","Ambush","LZ","HLS","Destroy","Capture","Secure","Danger","Avoid","Arrow"]],
		["Color:","combo","",["blue","red","green", "yellow", "purple", "orange", "white", "black"]],
		["Text:","input",""]
	];

if !(_layerNames isEqualTo []) then {
	_opt pushback ["Layer:","combo","",_layerNames];
};

[_device,_opt] call cse_fnc_setPopUpOptions_CC;