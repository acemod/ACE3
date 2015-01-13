/**
 * fn_manageLayers_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_device","_position"];
_device = call cse_fnc_getCurrentDeviceName_CC;

[_device,"open","Manage Layers",format[""]] spawn cse_fnc_setPopUpMenu_CC;

_layerNames = [];

_opt = [
		["Layer Name:","combo","",_layerNames],
		["Enable","btn",""]
	];

[_device,_opt] call cse_fnc_setPopUpOptions_CC;