/*
	File Name: fnc_reduceStats.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_player", "_speed", "_animStateChars", "_animP", "_amount"];

_player = (_this select 0);
_speed = abs(speed _player);

if ((vehicle _player) == _player) then {
	if (_speed > 1) then {
		GVAR(food) = GVAR(food) - (GVAR(food_decent_rate) + (_speed / 1000) + ((load _player) / 30));
		GVAR(water) = GVAR(water) - (GVAR(water_decent_rate) + (_speed / 450) + ((load _player) / 20));
	} else {
		GVAR(food) = GVAR(food) - (GVAR(food_decent_rate) + ((load _player) / 30));
		GVAR(water) = GVAR(water) - (GVAR(water_decent_rate) + ((load _player) / 20));
	};
};

if([] call FUNC(hasCamelbak)) then {
	_amount = 100 - GVAR(water);
	GVAR(camelbak) = GVAR(camelbak) - _amount;
	GVAR(water) = water + _amount;
};

if (GVAR(water) < 20 || GVAR(food) < 20) then {
	if (((speed _player) > 12) && ((vehicle _player) == _player)) then {
		_player playMove "amovppnemstpsraswrfldnon";
	};
};

if (GVAR(water) < 10 || GVAR(food) < 10) then {
	if (random(1) >= 0.75) then {
		[_player] call EFUNC(medical,setUnconscious);
	};
};

_animStateChars = toArray (animationState _player);
_animP = toString [_animStateChars select 5,_animStateChars select 6,_animStateChars select 7];

if (GVAR(water) < 8 || GVAR(food) < 8) then {
	if (((speed _player) > 1) && ((vehicle _player) == _player) && (_animP != "pne")) then {
		_player playMove "amovppnemstpsraswrfldnon";
	};
};

if (GVAR(water) < 1 || GVAR(food) < 1) then {
	if (random(1) > 0.2) then {
		[_player] call EFUNC(medical,setDead);
	};
};