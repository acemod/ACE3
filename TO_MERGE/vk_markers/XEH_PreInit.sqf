// #define DEBUG_MODE_FULL
#include "script_component.hpp"


if (isDedicated) then {
	LOG("Server: Creating variables");
	ISNILS(GVAR(static_markers),[]);
	ISNILS(GVAR(deleted_markers),[]);
	ISNILS(GVAR(gKilledType),"remove");
	publicVariable QGVAR(static_markers);
	publicVariable QGVAR(deleted_markers);
	publicVariable QGVAR(gKilledType);
	GVAR(postInit) = true;
} else {
	TRACE_2("Client: Initializing variables",GVAR(static_markers),GVAR(gKilledType));
	
	if (isNil QGVAR(static_markers)) then {
		GVAR(static_markers) = [];
		publicVariable QGVAR(static_markers);
	};
	if (isNil QGVAR(gKilledType)) then {
		GVAR(gKilledType) = "remove";
		publicVariable QGVAR(gKilledType);
	};
	if (isNil QGVAR(deleted_markers)) then {
		GVAR(deleted_markers) = [];
		publicVariable QGVAR(deleted_markers);
	};
	
	QGVAR(static_markers) addPublicVariableEventHandler {
		private ["_newArray","_newMarker","_visibleTo"];
		_newArray = _this select 1;
		TRACE_1("",_newArray);
		if (count _newArray < 1) exitWith {};
		
		{ // _x = marker data
			TRACE_1("ForEach",_x);
			if !(_x select 0 in allMapMarkers) then {
				_visibleTo = _x select 5;
				TRACE_2("ForEach2",_newMarker,_visibleTo);
				if (!((_x select 0) in GVAR(deleted_markers)) && {GVAR(playerSide) in _visibleTo}) then {
					TRACE_1("Creating propogated marker",_this);
					_x call FUNC(createMarker);
				};
			};
		} forEach _newArray;
		LOG("ForEachEnd");
	};
	GVAR(postInit) = false;
};



PREP(addMarker);
PREP(createMarker);
PREP(killed);
PREP(markerLoop);
PREP(mapLoop);
vk_fnc_addMarker = FUNC(addMarker);

/* Not used 
FUNC(globalMarker) = {
	private ["_visibleTo"];
	_visibleTo = _this select 5;
	if (GVAR(postInit)) then {
		if (GVAR(playerSide) in _visibleTo) then {
			TRACE_1("Creating propogated marker",_this);
			_this call FUNC(createMarker);
		};
	};
};
[QGVAR(globalMarker), {_this call FUNC(globalMarker)}] call CBA_fnc_addEventHandler;
*/

FUNC(deleteMarker) = {
	PARAMS_1(_name);
	private ["_remArray","_markerData","_markerName"];
	_remArray = [];
	for "_i" from 0 to (count GVAR(static_markers) - 1) do {
		if ((GVAR(static_markers) select _i) select 0 == _name) then {
			_remArray pushBack _i;
			[QGVAR(deleteMarker), GVAR(static_markers) select _i] call CBA_fnc_GlobalEvent;
			TRACE_2("Deleting static marker",_i,_name);
		};
	};
	TRACE_2("Before Removeindex",GVAR(static_markers),_remArray);
	if (isServer) then {  // Fix delete lag
		GVAR(static_markers) = [GVAR(static_markers),_remArray] call BIS_fnc_removeIndex;
		publicVariable QGVAR(static_markers);
	};
	{
		_markerData = _x getVariable [QGVAR(markerData),[""]];
		_markerName = _markerData select 0;
		if (_name == _markerName) then {
			[QGVAR(deleteMarker), _markerData] call CBA_fnc_GlobalEvent;
			_x setVariable [QGVAR(markerData),nil,true];
			_x setVariable [QGVAR(markerArray),nil,true];
			TRACE_2("Deleting marker from unit",_name,_x);
		};
	} forEach allUnits + vehicles;
};
vk_fnc_deleteMarker = FUNC(deleteMarker);
[QGVAR(deleteMarker), {_this call COMPILE_FILE(fnc_deleteMarker)}] call CBA_fnc_addEventHandler;

FUNC(hideMarker) = {
	PARAMS_1(_name);
	private ["_markerData","_markerName"];
	{
		_markerData = _x getVariable [QGVAR(markerData),[""]];
		_markerName = _markerData select 0;
		TRACE_1("",_markerData);
		if (_name == _markerName) then {
			[_markerData select 0, _markerData select 1] call COMPILE_FILE(fnc_deleteMarker);
			_x setVariable [QGVAR(markerArray),nil,false];
			TRACE_2("Hiding marker from unit",_name,_x);
		};
	} forEach allUnits + vehicles;
};

FUNC(playerCheck) = {
	LOG("Looking for player");
	if (!isNull player) then {
		TRACE_1("Player found",player);
		[(_this select 1)] call CBA_fnc_removePerFrameHandler;
	};
};
