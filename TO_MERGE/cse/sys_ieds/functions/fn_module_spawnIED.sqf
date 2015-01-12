/**
 * fn_module_spawnIED.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic", "_units", "_activated", "_totalCollection", "_collection", "_collectObjects"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if (!local _logic) exitwith {};

_totalCollection = [];
_collectObjects = {
	private ["_logic", "_collection"];
	_logic = _this select 0;
	_collection = synchronizedObjects _logic;
	{
		if !(_x in _totalCollection) then {
			if (typeOf _x == "cseModule_spawnIEDs") then {
				if !(_x getvariable ["cse_master_IED", false]) then {
					_x setvariable ["cse_subclass_IED", true];
					_x setvariable ["cse_controlledBy_IED",_logic];
					_totalCollection pushback _x;
					[_x] call _collectObjects;
				};
			} else {
				if (typeOf _x == "cseModule_triggerManLinkIEDS") then {
					_list = _x getvariable ["EnableList",""];
					_list = "[" + _list + "]";
					_parsedList = [] call compile _list;
					_triggerManList = (_logic getvariable ["cse_ieds_triggerManUnits", []]) + _parsedList;
					_logic setvariable ["cse_ieds_triggerManUnits", _triggerManList];
					[format["_triggerManList %1",_triggerManList]] call cse_fnc_debug;
				};
			};
		};
	}foreach _collection;
};

if !(_logic getvariable ["cse_subclass_IED",false]) then {
	_logic setvariable ["cse_master_IED", true];
	[_logic] call _collectObjects;
	if (_logic getvariable ["cse_master_IED", false]) then {
		_logic setvariable ["cse_iedCollection", (_logic getvariable ["cse_iedCollection",[]]) + _totalCollection];
		[format["%1 I am a master IED. Collection is: %2", _logic, (_logic getvariable ["cse_iedCollection",[]])]] call cse_fnc_debug;
		if (isnil "CSE_MASTER_IED_COLLECTION") then {
			CSE_MASTER_IED_COLLECTION = [];
		};
		CSE_MASTER_IED_COLLECTION pushback _logic;
	};
};

[_logic] call cse_fnc_createIEDObject_IEDS;

_activatedSides = _logic getvariable ["activatedForSides", -1];
_activatedTargets = _logic getvariable ["activatedForTargets", -1];

_activatedTargets = switch (_activatedTargets) do {
	case 0: {["CaManBase", "Air", "Car", "Motorcycle", "Tank"]};
	case 1: {["Air", "Car", "Motorcycle", "Tank"]};
	case 2: {["Car", "Motorcycle", "Tank"]};
	case 3: {["Air"]};
	case 4: {["CaManBase"]};
	default {[]};
};
_logic setvariable ["activatedForTargets", _activatedTargets];

_activatedSides = switch (_activatedSides) do {
	case 0: {[west, east, independent, civilian, sideEnemy, sideFriendly]};
	case 1: {[west, sideEnemy]};
	case 2: {[east, sideEnemy]};
	case 3: {[independent, sideEnemy]};
	case 4: {[civilian, sideEnemy]};
	default {[]};
};

_logic setvariable ["activatedForSides", _activatedSides, true];
_logic setvariable ["iedActivationType", _logic getvariable ["iedActivationType",0], true];