/*
	NAME: fnc_displayBFTSymbolOnPerson.sqf
	USAGE: grabs BFT item and information from unit, then returns information
	AUTHOR: Glowbal
	ARGUMENTS: PERSON / UNIT.
	RETURN: 2d ARRAY. Contains information about every tracker on unit.
*/

private ["_person","_trackers","_tracker","_newMarker","_filterLevel","_return"];
_person = _this select 0;
_return = [];
_trackers = [_person] call cse_fnc_getAllBFTItems_CC;
{
	_trackerInfo = [_person] call cse_fnc_getTrackerInformation_CC;

	if (_trackerInfo select 2) then {
		_prefix = switch (([_x] call cse_fnc_getDeviceSide_CC)) do {
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

		_return pushback [_icon,getPos _person, (_trackerInfo select 1),CSE_SIDE_WEST_COLOR,_x,_person,([_x] call cse_fnc_getDeviceSide_CC)];
	};
}foreach _trackers;
_return