
private ["_enableTracking","_toggleRoute","_toggleIntel","_return", "_iconType", "_callsign", "_person", "_trackerInfo"];
_return = [];
if (!isDedicated) then {
	{
		_person = _x;
		_trackerInfo = [_person] call cse_fnc_getTrackerInformation_CC;
		if (_trackerInfo select 2) then {
			_positionOf =  getPosASL _person;
			_trackers = [_person] call cse_fnc_getAllBFTItems_CC;
			{
				_sideOfDevice = ([_x] call cse_fnc_getDeviceSide_CC);

				_prefix = switch (_sideOfDevice) do {
					case WEST: {"b_"};
					case EAST: {"o_"};
					case independent: {"n_"};
					default {"n_"};
				};

				_prefix = "\A3\ui_f\data\map\markers\nato\" + _prefix;
				_icon = switch (_trackerInfo select 0) do {
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
				_return pushback [_icon, _positionOf, (_trackerInfo select 1), CSE_SIDE_WEST_COLOR, _x, _person, _sideOfDevice];
			}foreach _trackers;
		};
	}foreach allUnits;

	{
		_info = _x getvariable "cse_bft_info_cc";
		if (!isnil "_info") then {
			if (isEngineOn _x) then {
				_prefix = switch (side _x) do {
					case WEST: {"b_"};
					case EAST: {"o_"};
					case independent: {"n_"};
					default {"n_"};
				};
				_prefix = "\A3\ui_f\data\map\markers\nato\" + _prefix;
				_icon = switch (_info select 0) do {
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

				_return pushback [_icon,getPosASL _x, _info select 1,CSE_SIDE_WEST_COLOR,"vehicle",_x, side _x];
			};
		} else {
			if !(_x in allUnitsUav) then {
				if (local _x) then {
					if (CSE_AUTO_ASSIGN_CALLSIGNS_CC == 0 || CSE_AUTO_ASSIGN_CALLSIGNS_CC == 1) then {
						_iconType = switch (true) do {
							case (_x isKindOf "Car"): {"Motorized"};
							case (_x isKindOf "Helicopter"): {"Helicopter"};
							case (_x isKindOf "Air"): {"Plane"};
							case (_x isKindOf "Armor"): {"Armor"};
							case (_x isKindOf "Boat"): {"Naval"};
							case (_x isKindOf "Artillery"): {"Artillery"};
							default {"Unknown"};
						};
						_callsign = [_x] call cse_fnc_findTargetName_gui;
						_x setvariable ["cse_bft_info_cc", [_iconType, _callsign, false, true], true];
					};
				};
			};
		};

	}foreach vehicles;

	if (CSE_AUTO_SHOW_UAV_TRACKERS_ON_BFT) then {
		{
			_info = _x getvariable "cse_bft_info_cc";
			if (isnil "_info") then {
				if (isEngineOn _x) then {
					_prefix = switch (side _x) do {
						case WEST: {"b_"};
						case EAST: {"o_"};
						case independent: {"n_"};
						default {"n_"};
					};
					_return pushback [ "\A3\ui_f\data\map\markers\nato\" +  _prefix + "uav.paa",getPosASL _x, [_x] call cse_fnc_findTargetName_gui,CSE_SIDE_WEST_COLOR,"uav",_x, side _x];
				};
			};
		}foreach allUnitsUav;
	};
};
_return