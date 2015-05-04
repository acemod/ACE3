[] spawn {
	private ["_type","_pos","_mods","_side"];
	{
		_type = markerType _x;
		if (_type == "vk_mapmarker") then {
			_pos = markerPos _x;
			_mods = markerText _x;
			_side = switch (markerColor _x) do {
				case "ColorOPFOR": {OPFOR};
				case "ColorRed": {OPFOR};
				case "ColorGreen": {Independent};
				case "ColorIndependent": {Independent};
				case "ColorKhaki": {Independent};
				case "ColorYellow": {"Unknown"};
				case "ColorUnknown": {"Unknown"};
				default {BLUFOR};
			};
			deleteMarker _x;
			[_x,_pos,_side,_mods] call vk_fnc_addMarker;
		};
	} forEach allMapMarkers;
	sleep 1;
};