/*
	Name: ACE_Goggles_fnc_RainEffect
	
	Author: Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		Nothing
	
	Returns:
		Nothing
	
	Example:
		[] spawn ACE_Goggles_fnc_RainEffect;
*/
#include "\ACE_Goggles\script.sqf"
ACE_Goggles_RainDrops = objNull;
ACE_Goggles_Rain_Active = false;
_fnc_underCover = {
	private ["_pos", "_unit"];
	_unit = (_this select 0);
	if (vehicle _unit != _unit && {!([_unit] call ACE_Core_fnc_isTurnedOut)}) exitWith {true};
	_pos = eyePos _unit;
	((positionCameraToWorld [0,0,1] select 2) < ((positionCameraToWorld [0,0,0] select 2) - 0.4)) || {(lineIntersects [_pos, _pos vectorAdd [0,0,15], _unit])}
};
private ["_lastRain"];
_lastRain = 0;
while {alive player} do {
	sleep 0.5;
	if (isNull(findDisplay 312)) then {
		// Ignore if player is under water
		if (!ACE_Goggles_EffectsActive || {underwater player}) exitWith{call ACE_Goggles_fnc_RemoveRainEffect;};
		if (_lastRain != rain) then {
			call ACE_Goggles_fnc_RemoveRainEffect;
			_lastRain = rain;
			// Rain is happening
			if (_lastRain > 0.05 && {!([player] call _fnc_underCover)}) then {
				ACE_Goggles_Rain_Active = true;
				ACE_Goggles_RainDrops = "#particlesource" createVehicleLocal GetPos player;
				ACE_Goggles_RainDrops setParticleClass "ACERainEffect";
				ACE_Goggles_RainDrops setDropInterval (0.07 * (1.1 - _lastRain));
				ACE_Goggles_RainDrops attachTo [vehicle player,[0,0,0]];
			};
		}else{
			if (_lastRain > 0.05) then {
				if (ACE_Goggles_Rain_Active && {[player] call _fnc_underCover}) exitWith {
					call ACE_Goggles_fnc_RemoveRainEffect;
				};
				if (!ACE_Goggles_Rain_Active) then {
					_lastRain = -1;
				};
			};
		};
	}else{
		if (ACE_Goggles_Rain_Active) then {
			call ACE_Goggles_fnc_RemoveRainEffect;
		};
	};
};