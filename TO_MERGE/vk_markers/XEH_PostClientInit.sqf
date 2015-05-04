// #define DEBUG_MODE_FULL
#include "script_component.hpp"


private ["_visibleTo","_gPlayerBFT"];
if (!isDedicated) then {

	[FUNC(playerCheck), 0, []] call CBA_fnc_addPerFrameHandler;
	
	LOG("PostInit Started");
			
	GVAR(playerSide) = side player;
	GVAR(playerBFT) = false;
	
	_gPlayerBFT = player getVariable QGVAR(BFT);
	if (isNil "_gPlayerBFT") then {
		GVAR(gPlayerBFT) = false;
	} else {
		GVAR(gPlayerBFT) = _gPlayerBFT;
	};

	if (vehicle player != player) then {
		[vehicle player,"",player] call COMPILE_FILE(fnc_getIn);
	};

	{ // Create static markers
		_visibleTo = _x select 5;
		if (!((_x select 0) in GVAR(deleted_markers)) && {GVAR(playerSide) in _visibleTo}) then {
			TRACE_1("Creating static marker",_x);
			_x call FUNC(createMarker);
		};
	} forEach GVAR(static_markers);
	TRACE_1("Created static markers",GVAR(static_markers));
	
	GVAR(postInit) = true;
	LOG("PostInit complete");
			
	GVAR(markerLoopHandler) = [FUNC(markerLoop), 2, []] call CBA_fnc_addPerFrameHandler;
	// [] call FUNC(mapLoop);
};