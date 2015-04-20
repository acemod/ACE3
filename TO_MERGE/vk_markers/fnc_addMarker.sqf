// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_4(_name,_unit,_type,_mods);
DEFAULT_PARAM(4,_groupSize,-1);
DEFAULT_PARAM(5,_scale,1);
DEFAULT_PARAM(6,_visibleTo,nil);
DEFAULT_PARAM(7,_text,"");
DEFAULT_PARAM(8,_bft,false);

private ["_pos","_data"];

// Alternate spellings
{
	switch (_x) do {
		case "infantry": {_mods set [_foreachIndex, "inf"]};
		case "armour": {_mods set [_foreachIndex, "armor"]};
		case "motorized": {_mods set [_foreachIndex, "motor"]};
		case "artillery": {_mods set [_foreachIndex, "arty"]};
		case "engineer": {_mods set [_foreachIndex, "eng"]};
		case "unitair": {_mods set [_foreachIndex, "airunit"]};
		case "airvehicle": {_mods set [_foreachIndex, "airunit"]};
		case "unitland": {_mods set [_foreachIndex, "landunit"]};
	};
} forEach _mods;

// Air unit markers
if ("airunit" in _mods) then {
	if ("fixed" in _mods) then {
		REM(_mods,"fixed");
	};
	if (!("rotary" in _mods) && "attack" in _mods) then {
		REM(_mods,"attack");
		PUSH(_mods,"fattack");
	};
	if (!("rotary" in _mods) && "cargo" in _mods) then {
		REM(_mods,"cargo");
		PUSH(_mods,"fcargo");
	};
	if (!("rotary" in _mods) && "uav" in _mods) then {
		REM(_mods,"uav");
		PUSH(_mods,"fuav");
	};
};


// Special graphics &&/|| combinations
if (("sam" in _mods || "aaa" in _mods) && !("aa" in _mods)) then {
	PUSH(_mods,"aa");
};
if ("aa" in _mods && "armor" in _mods) then {
	REM(_mods,"armor");
	PUSH(_mods,"armoraa");
};
if ("eng" in _mods && "armor" in _mods) then {
	REM(_mods,"eng");
	PUSH(_mods,"engarmor");
};
if ("maint" in _mods && "armor" in _mods) then {
	REM(_mods,"maint");
	PUSH(_mods,"maintarmor");
};
if ("medic" in _mods && ("fixed" in _mods || "rotary" in _mods )) then {
	REM(_mods,"medic");
	PUSH(_mods,"airmed");
};
if ("sof" in _mods && ("fixed" in _mods || "rotary" in _mods )) then {
	REM(_mods,"sof");
	PUSH(_mods,"airsof");
};
if ("reduced" in _mods && "reinforced" in _mods) then {
	REM(_mods,"reduced");
	REM(_mods,"reinforced");
	PUSH(_mods,"rereduced");
};
if ("damaged" in _mods) then { // Ensure graphics is last i.e. on top
	REM(_mods,"damaged");
	PUSH(_mods,"damaged");
};
if ("destroyed" in _mods) then {
	REM(_mods,"destroyed");
	PUSH(_mods,"destroyed");
};

if (IS_STRING(_type)) then {
	_type = toLower _type;
	switch (_type) do {
		case "west": {_type = west};
		case "blufor": {_type = west};
		case "east": {_type = east};
		case "opfor": {_type = east};
		case "independent": {_type = independent};
		case "resistance": {_type = independent};
	};
};

if (IS_ARRAY(_unit)) then { // Positions
	LOG("Type = ARRAY");
	_pos = _unit;
	if (isNil "_visibleTo") then {
		_visibleTo = [west, east, resistance];
		// TRACE_1("Default",_visibleTo);
	};
	if (!IS_ARRAY(_visibleTo)) then {
		_visibleTo = [_visibleTo];
		// TRACE_1("toArray",_visibleTo);
	};
	_data = [_name,_mods,_type,_groupSize,_scale,_visibleTo,_text,_pos];
	TRACE_1("",_data);
	
	if (isServer || {GVAR(postInit)}) then {
		PUSH(GVAR(static_markers),_data);
		publicVariable QGVAR(static_markers);
	};
	if (GVAR(postInit)) then {
		_data call FUNC(createMarker);
	};
	
	// [QGVAR(globalMarker), _data] call CBA_fnc_GlobalEvent;
	
} else { // Units or Groups
	LOG("Type = UNIT");
	if (isNil "_visibleTo") then { //ISNILS(_visibleTo, side _unit);
		_visibleTo = side _unit;
		// TRACE_1("Default",_visibleTo);
	};
	if (!IS_ARRAY(_visibleTo)) then {
		_visibleTo = [_visibleTo];
		// TRACE_1("toArray",_visibleTo);
	};
	_data = [_name,_mods,_type,_groupSize,_scale,_visibleTo,_text];
	TRACE_1("",_data);
	_unit setVariable [QGVAR(markerData),_data,true];
	_unit setVariable [QGVAR(markerBFT),_bft,true];
};