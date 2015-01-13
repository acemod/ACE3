/**
 * fn_placeMarker_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_args","_position","_type"];
_args = (_this select 0);
_position = _this select 1;
_type = _this select 2;
_side = _this select 3;

if (isnil "CSE_SIDE_WEST_COLOR") then {
		_r = profilenamespace getvariable ['Map_BLUFOR_R',0];
		_g = profilenamespace getvariable ['Map_BLUFOR_G',0.8];
		_b = profilenamespace getvariable ['Map_BLUFOR_B',1];
		_a = profilenamespace getvariable ['Map_BLUFOR_A',0.8];
		CSE_SIDE_WEST_COLOR = [_r,_g,_b,_a];

		CSE_SIDE_EAST_COLOR =
			[
				profilenamespace getvariable ['Map_OPFOR_R',1],
				profilenamespace getvariable ['Map_OPFOR_G',0.5],
				profilenamespace getvariable ['Map_OPFOR_B',0.5],
				profilenamespace getvariable ['Map_OPFOR_A',0.8]
			];

		_r = profilenamespace getvariable ['Map_Independent_R',0];
		_g = profilenamespace getvariable ['Map_Independent_G',1];
		_b = profilenamespace getvariable ['Map_Independent_B',1];
		_a = profilenamespace getvariable ['Map_OPFOR_A',0.8];
		CSE_SIDE_IND_COLOR = [_r,_g,_b,_a];
};

if (_type == "intel") exitwith {
	CSE_TOGGLE_INTEL_LAYER_CC = true;
	if (isnil "CSE_INTEL_MARKER_COLLECTION_CC") then {
		CSE_INTEL_MARKER_COLLECTION_CC = [];
	};
	_usedDesc = false;
	_text = "";
	if ((_args select 5) == "") then {
		_text = _text + (_args select 0);
		_text = _text + " / " + (_args select 2);
		_text = _text + " / " + (_args select 4);
		_text = _text + (_args select 3);
	} else {
		_text = _args select 5;
		_usedDesc = true;
	};
	_text = _text + format["(%1:%2)",Date select 3, Date select 4];

	_prefix = switch (_args select 1) do {
		case "BLUFOR": {"b_"};
		case "OPFOR": {"o_"};
		case "GREENFOR": {"n_"};
		default {"n_"};
	};
	_prefix = "\A3\ui_f\data\map\markers\nato\" + _prefix;
	_icon = switch (_args select 0) do {
		case "Infantry": {_prefix+"inf.paa"};
		case "Motorized": {_prefix+"motor_inf.paa"};
		case "Plane": {_prefix+"plane.paa"};
		case "Helicopter": {_prefix+"air.paa"};
		case "Armor": {_prefix+"armor.paa"};
		case "Naval": {_prefix+"naval.paa"};
		case "HQ": {_prefix+"hq.paa"};
		case "Medical": {_prefix+"med.paa"};
		case "Maintanance": {_prefix+"maint.paa"};
		case "Artillery": {_prefix+"art.paa"};
		case "Mortar": {_prefix+"mortar.paa"};
		case "Service": {_prefix+"service.paa"};
		case "Recon": {_prefix+"recon.paa"};
		case "Mechanized": {_prefix+"mech_inf.paa"};
		case "uav": {_prefix+"uav.paa"};
		case "Installation": {_prefix+"installation.paa"};
		default {_prefix+"unknown.paa"};
	};


	_color = switch (_args select 1) do {
		case "BLUFOR": {CSE_SIDE_WEST_COLOR};
		case "OPFOR": {CSE_SIDE_EAST_COLOR};
		case "GREENFOR": {CSE_SIDE_IND_COLOR};
		case "UNKNOWN": {[0.6,0.2,0.1,0.8]};
		default {CSE_SIDE_IND_COLOR};
	};

	_placementArgs = [ _icon, _text, +_color];
	[format["Placed a Marker: %1", [_position, _placementArgs, time, _side, _args select 6, _usedDesc]]] call cse_fnc_debug;
	CSE_INTEL_MARKER_COLLECTION_CC pushback [_position,_placementArgs,time, _side, _args select 6, _usedDesc];
};

if (_type == "route") exitwith {
	CSE_TOGGLE_ROUTE_LAYER_CC = true;
	if (isnil "CSE_ROUTE_MARKER_COLLECTION_CC") then {
		CSE_ROUTE_MARKER_COLLECTION_CC = [];
	};
	_text = "";
	_text = _text + (_args select 2);
	_text = _text + format["(%1:%2)",Date select 3, Date select 4];


	_prefix = "\A3\ui_f\data\map\markers\military\";
	_icon = switch (_args select 0) do {
		case "waypoint": {"\A3\ui_f\data\map\groupicons\waypoint.paa"};
		case "ReOrg": {"\A3\ui_f\data\map\groupicons\waypoint.paa"};
		case "Crossing": {"\A3\ui_f\data\map\markers\military\pickup_CA.paa"};
		case "Ambush": {"\A3\ui_f\data\map\markers\military\ambush_CA.paa"};
		case "LZ": {"\A3\ui_f\data\map\markers\military\pickup_CA.paa"};
		case "HLS": {"\A3\ui_f\data\map\markers\military\pickup_CA.paa"};
		case "Destory": {"\A3\ui_f\data\map\markers\military\destroy_CA.paa"};
		case "Capture": {"\A3\ui_f\data\map\markers\military\objective_CA.paa"};
		case "Secure": {"\A3\ui_f\data\map\markers\military\objective_CA.paa"};
		case "Danger": {"\A3\ui_f\data\map\markers\military\warning_CA.paa"};
		case "Avoid": {"\A3\ui_f\data\map\markers\military\warning_CA.paa"};
		case "Dot": {"\A3\ui_f\data\map\markers\military\dot_CA.paa"};
		case "Arrow": {"\A3\ui_f\data\map\markers\military\arrow_CA.paa"};
		default {"\A3\ui_f\data\map\groupicons\waypoint.paa"};
	};

	_color = switch (_args select 1) do {
		case "blue": {CSE_SIDE_WEST_COLOR};
		case "red": {CSE_SIDE_EAST_COLOR};
		case "green": {CSE_SIDE_IND_COLOR};
		case "yellow": {[0.74, 0.74, 0.08, 0.9]};
		case "orange": {[1, 0.51, 0.08, 0.9]};
		case "white": {[1,1,1, 0.9]};
		case "black": {[0,0,0, 0.9]};
		case "purple": {[0.34,0.6,0.42, 0.9]};
		default {CSE_SIDE_IND_COLOR};
	};

	_placementArgs = [ _icon, _text, +_color];
	CSE_ROUTE_MARKER_COLLECTION_CC pushback [_position,_placementArgs,time, _side, _args select 3];
	[format["Placed a Marker: %1", [_position,_placementArgs,time, _side, _args select 3]]] call cse_fnc_debug;

};