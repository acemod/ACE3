/*
	Name: AGM_Goggles_fnc_isInRotorWash
	
	Author: Garth de Wet (LH)
	
	Description:
	Checks for nearby helicopters (within 15m)
	
	Parameters:
	0: Object - Unit
	1: NUMBER - (optional) Radius to check for helicopter Default: 15
	
	Returns:
	Array:
		0 - boolean - If in rotorwash
		1 - number - Amount of rotor wash.
	
	Example:
		if (([player, 10] call AGM_Goggles_fnc_isInRotorWash) select 0) then { hint "Rotor wash"; };
		if (([player] call AGM_Goggles_fnc_isInRotorWash) select 0) then { hint "Rotor wash"; };
*/
private ["_heli", "_unit", "_result", "_radius"];
_unit = _this select 0;
_radius = 15;
if (count _this > 1) then {
	_radius = _this select 1;
};
_result = [false, _radius + 2];

_heli = (getPosATL _unit) nearEntities [["Helicopter"], _radius];
{
	if !(_x isKindOf "ParachuteBase") then {
		if (isEngineOn _x) then {
			private "_distance";
			_distance = (_radius - (_unit distance _x));
			if (_distance != 0) then {
				_distance = _distance / _radius;
			};
			if (_distance < (_result select 1)) then {
				_result = [true, _distance];
			};
		};
	};
} count _heli;

_result
