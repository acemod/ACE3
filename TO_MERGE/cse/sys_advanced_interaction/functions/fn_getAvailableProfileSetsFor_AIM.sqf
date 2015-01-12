/**
 * fn_getAvailableProfileSetsFor_AIM.sqf
 * Descr: Get available options for a profile set. Profile sets can be any of the following: Cultures, Occupations, PoliticalViews, SupportedSides, homeTown.
 *
 * Author: Glowbal
 *
 * Arguments: [unit OBJECT, side SIDE, faction STRING (Faction classname), set STRING (What set should be returned) ]
 * Return: ARRAY Returns an array with the available profile set options. Is an array of strings in all cases but homeTown, which returns a 2D array.
 * PublicAPI: true
 */


#define ALL_LOCATIONS ["Strategic","StrongpointArea","FlatArea","FlatAreaCity","FlatAreaCitySmall","CityCenter","Airport","NameMarine","NameCityCapital","NameCity","NameVillage","NameLocal","Hill","ViewPoint","RockArea","BorderCrossing","VegetationBroadleaf","VegetationFir","VegetationPalm","VegetationVineyard"]
#define NEAREST_LOCATION_RADIUS 700


private ["_side","_faction","_set","_return", "_result", "_locationClose", "_locationFar", "_locationsClose", "_locationsFar", "_htReturn"];
_unit = _this select 0;
_side = _this select 1;
_faction = _this select 2;
_set = _this select 3;

_return = switch (_set) do {
	case "Cultures": {
		switch (_side) do {
			case civilian: {
				["Greek", "Other"]
			};
			default {["Unknown"]};
		};
	};
	case "Occupations": {
		switch (_side) do {
			case civilian: {
				["Baker", "Butcher", "Mechanic", "Writer", "Law_Enforcement", "Retired", "None", "Unknown", "Farmer", "Software_Developer", "Hunter", "Artist", "Banker", "Fireman", "Cook", "Construction_Worker", "Fisher","Repair_man", "Cleaner", "Woods_man", "Painter"]
			};
			default {["Soldier"]};
		};
	};
	case "PoliticalViews": {
		switch (_side) do {
			case civilian: {
				["Normal", "Radical", "Mild", "None"]
			};
			default {["Unknown"]};
		};
	};
	case "SupportedSides": {
		switch (_side) do {
			case civilian: {
				_stances = [];
				if (cse_stance_systemBlufor > 10) then {
					_stances pushback West;
				};
				if (cse_stance_systemOpfor > 10) then {
					_stances pushback east;
				};
				if (cse_stance_systemRes > 10) then {
					_stances pushback independent;
				};
				if (count _stances == 0) then {
					_stances set [ 0, Civilian ];
				};

				_stances
			};
			default {[_side]};
		};
	};
	case "homeTown": {
		_htReturn = [["Unknown","Unknown"]];
		switch (_side) do {
			case civilian: {
				if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
					["ALiVE is loaded. Returning result with AlIVE settings", 1] call cse_fnc_debug;
					_result = [_unit] call cse_fnc_getALiVECivData_AIM;
					if (isnil "_result") then {
						_result = [];
					};
					_locationClose = "";
					_locationFar = "";
					if (count _result > 0) then {
						_locationsClose = (nearestLocations  [_result select 1, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						_locationsFar = (nearestLocations  [_result select 2, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						if (count _locationsClose > 0) then {
							_locationClose = text (_locationsClose select 0);
						};
						if (count _locationsFar > 0) then {
							if (count _locationsFar > 1) then {
								_locationFar = text (_locationsClose select 1);
							} else {
								_locationFar = text (_locationsClose select 0);
							};
						};
						_htReturn = [[_locationClose,_locationFar]];
					} else {
						_htReturn = [["Unknown","Unknown"]];
					};
				} else {
					_htReturn = [["Unknown","Unknown"]];
				};
			};
			default {_htReturn = [["Unknown","Unknown"]]};
		};
		_htReturn;
	};
	default {
		["Unknown"]
	};
};

_return