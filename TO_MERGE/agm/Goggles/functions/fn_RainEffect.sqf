/*
	Name: AGM_Goggles_fnc_RainEffect
	
	Author: Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		Nothing
	
	Returns:
		Nothing
	
	Example:
		[] spawn AGM_Goggles_fnc_RainEffect;
*/
#include "\AGM_Goggles\script.sqf"
AGM_Goggles_RainDrops = objNull;
AGM_Goggles_Rain_Active = false;
_fnc_underCover = {
	private ["_pos", "_unit"];
	_unit = (_this select 0);
	if (vehicle _unit != _unit && {!([_unit] call AGM_Core_fnc_isTurnedOut)}) exitWith {true};
	_pos = eyePos _unit;
	((positionCameraToWorld [0,0,1] select 2) < ((positionCameraToWorld [0,0,0] select 2) - 0.4)) || {(lineIntersects [_pos, _pos vectorAdd [0,0,15], _unit])}
};
private ["_lastRain"];
_lastRain = 0;
while {alive player} do {
	sleep 0.5;
	if (isNull(findDisplay 312)) then {
		// Ignore if player is under water
		if (!AGM_Goggles_EffectsActive || {underwater player}) exitWith{call AGM_Goggles_fnc_RemoveRainEffect;};
		if (_lastRain != rain) then {
			call AGM_Goggles_fnc_RemoveRainEffect;
			_lastRain = rain;
			// Rain is happening
			if (_lastRain > 0.05 && {!([player] call _fnc_underCover)}) then {
				AGM_Goggles_Rain_Active = true;
				AGM_Goggles_RainDrops = "#particlesource" createVehicleLocal GetPos player;
				AGM_Goggles_RainDrops setParticleClass "AGMRainEffect";
				AGM_Goggles_RainDrops setDropInterval (0.07 * (1.1 - _lastRain));
				AGM_Goggles_RainDrops attachTo [vehicle player,[0,0,0]];
			};
		}else{
			if (_lastRain > 0.05) then {
				if (AGM_Goggles_Rain_Active && {[player] call _fnc_underCover}) exitWith {
					call AGM_Goggles_fnc_RemoveRainEffect;
				};
				if (!AGM_Goggles_Rain_Active) then {
					_lastRain = -1;
				};
			};
		};
	}else{
		if (AGM_Goggles_Rain_Active) then {
			call AGM_Goggles_fnc_RemoveRainEffect;
		};
	};
};