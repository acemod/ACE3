/*
	fnc_rainEffect.sqf

	Author: Garth de Wet (LH)

	Description:


	Parameters:
		Nothing

	Returns:
		Nothing

	Example:
		[] spawn FUNC(RainEffect);
*/
#include "script_component.hpp"
GVAR(RainDrops) = objNull;
GVAR(RainActive) = false;
_fnc_underCover = {
	private ["_pos", "_unit"];
	_unit = (_this select 0);
	if (vehicle _unit != _unit && {!([_unit] call EFUNC(common,isTurnedOut))}) exitWith {true};
	_pos = eyePos _unit;
	((positionCameraToWorld [0,0,1] select 2) < ((positionCameraToWorld [0,0,0] select 2) - 0.4)) || {(lineIntersects [_pos, _pos vectorAdd [0,0,15], _unit])}
};
private ["_lastRain"];
_lastRain = 0;
while {alive ace_player} do {
	sleep 0.5;
	if (isNull(findDisplay 312)) then {
		// Ignore if ace_player is under water
		if (!GVAR(EffectsActive) || {underwater ace_player}) exitWith{call FUNC(RemoveRainEffect);};
		if (_lastRain != rain) then {
			call FUNC(RemoveRainEffect);
			_lastRain = rain;
			// Rain is happening
			if (_lastRain > 0.05 && {!([ace_player] call _fnc_underCover)}) then {
				GVAR(RainActive) = true;
				GVAR(RainDrops) = "#particlesource" createVehicleLocal GetPos ace_player;
				GVAR(RainDrops) setParticleClass "ACERainEffect";
				GVAR(RainDrops) setDropInterval (0.07 * (1.1 - _lastRain));
				GVAR(RainDrops) attachTo [vehicle ace_player,[0,0,0]];
			};
		}else{
			if (_lastRain > 0.05) then {
				if (GVAR(RainActive) && {[ace_player] call _fnc_underCover}) exitWith {
					call FUNC(RemoveRainEffect);
				};
				if (!GVAR(RainActive)) then {
					_lastRain = -1;
				};
			};
		};
	}else{
		if (GVAR(RainActive)) then {
			call FUNC(RemoveRainEffect);
		};
	};
};
