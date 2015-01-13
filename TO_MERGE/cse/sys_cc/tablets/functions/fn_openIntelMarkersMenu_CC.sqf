/**
 * fn_openIntelMarkersMenu_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_device","_position", "_opt"];
_device = _this select 0;
_position = _this select 1;

[_device,"open","SALUTE Report",format["[_this,%1,'intel', ([([] call cse_fnc_getCurrentDeviceName_CC)] call cse_fnc_getDeviceSide_CC)] call cse_fnc_placeMarker_CC",_position]] call cse_fnc_setPopUpMenu_CC;


_opt = [
		["Type:","combo","",
		["Infantry","Motorized","Plane","Helicopter","Armor","Naval","HQ","Medical","Maintanance","Artillery","Mortar","Service","Recon","Mechanized","uav","Installation","Unknown"]
		],
		["Side:","combo","",["BLUFOR","OPFOR","GREENFOR","UNKNOWN"]],
		["direction:","combo","",["Static","North","North East","East","South East","South","South West","West","North West"]],
		["Size:","combo","",["Pax","Fire Team","Section","Platoon","Company","Battalion","Regiment", "Brigade"]],
		["","combo","",["1x","2x","3x","4x","5x","6x", "7x"]],
		["Description:","input",""]
	];
[_device,_opt] call cse_fnc_setPopUpOptions_CC;