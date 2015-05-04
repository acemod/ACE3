#include "script_component.hpp"
[] spawn {
	if (GVAR(playerCreate)) then {
		while {true} do {
			private ["_type","_pos","_mods","_side","_mt","_ma"];
			if !(GVAR(playerCreate)) exitWith {};
			{
				_type = markerType _x;
				if (_type == "hd_objective") then {
					_pos = markerPos _x;
					_mt = markerText _x;
					_mods = [];
					_ma = [_mt,","] call bis_fnc_splitString;
					{
						private ["_temp"];
						_temp =[_x] call bis_fnc_filterString;
						[_mods,_temp] call bis_fnc_arrayPush;
					} forEach _ma;
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
					[_x,_pos,_side,_mods,-1,1.1] call vk_fnc_addMarker;
				};
			} forEach allMapMarkers;
			sleep 1;
		};
	};
};