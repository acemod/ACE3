// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_unit);

private ["_markerData","_markerArray","_killedType","_pos","_dummy"];

_markerData = _unit getVariable QGVAR(markerData);
_markerArray = _unit getVariable QGVAR(markerArray);
_killedType = _unit getVariable QGVAR(killedType);
_bft = _unit getVariable QGVAR(markerBFT);

if (isNil "_markerData") exitWith {
	TRACE_1("No markerData for unit",_unit);
	if (!isNil "_markerArray") exitWith {
		_unit setVariable [QGVAR(markerArray),nil,true];
	};
};
if (isNil "_markerArray") exitWith {
	TRACE_1("No markerArray for unit",_unit);
	_unit setVariable [QGVAR(markerData),nil,true];
};

EXPLODE_7(_markerData,_name,_mods,_type,_size,_scale,_visibleTo,_text);
_pos = getPos _unit;

if (isNil "_killedType") then {
	_killedType = GVAR(gKilledType);
};
TRACE_2("",_killedType,_bft);
switch (_killedType) do {
	case "static": {
		LOG("Recreate marker as static");
		[QGVAR(deleteMarker), _markerData] call CBA_fnc_GlobalEvent;
		[_name] call FUNC(deleteMarker);
		_dummy = createVehicle ["Land_PencilGreen_F", _pos, [], 0, "NONE"];
		_dummy setPosATL [_pos select 0, _pos select 1, -5];
		[_name,_dummy,_type,_mods,_size,_scale,_visibleTo,_text,_bft] call FUNC(addMarker);
	};
	case "destroy": {
		LOG("Adding destroyed marker");
		PUSH(_mods,"destroyed");
		TRACE_1("",_mods);
		[QGVAR(deleteMarker), _markerData] call CBA_fnc_GlobalEvent;
		[_name] call FUNC(deleteMarker);
		_dummy = createVehicle ["Land_PencilGreen_F", _pos, [], 0, "NONE"];
		_dummy setPosATL [_pos select 0, _pos select 1, -5];
		[_name,_dummy,_type,_mods,_size,_scale,_visibleTo,_text,_bft] call FUNC(addMarker);
	};
	case "remove": {
		LOG("Remove marker");
		[QGVAR(deleteMarker), _markerData] call CBA_fnc_GlobalEvent;
		[_name] call FUNC(deleteMarker);
	};
};