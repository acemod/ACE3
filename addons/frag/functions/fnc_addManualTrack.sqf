#include "script_component.hpp"
private ["_round"];
_round = _this select 0;
if(alive _round) then {
	GVAR(trackedObjects) set[(count GVAR(trackedObjects)), _round];
	[DFUNC(trackFragRound), 0, [_round, (getPosASL _round), (velocity _round), (typeOf _round), time, objNull, false, 0, 0]] call cba_fnc_addPerFrameHandler;
};