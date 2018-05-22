/*
	File Name: fnc_reduceStats.sqf
	Author: Jak Keen
*/

#include "script_component.hpp"

private ["_speed", "_animStateChars", "_animP", "_amount", "_decent"];
params ["_player"];

_speed = abs(speed _player);

if ((vehicle _player) == _player) then {
    GVAR(food) = GVAR(food) - (GVAR(food_decent_rate) + (_speed / 1000) + ((load _player) / 30));

    _decent = (GVAR(water_decent_rate) + (_speed / 450) + ((load _player) / 20));

    if(([] call FUNC(hasCamelbak)) && ((GVAR(camelbak) - _decent) >= 0)) then {
        GVAR(camelbak) = GVAR(camelbak) - _decent;

        if(GVAR(water) < 100) then {
            [nil, nil, 2] call FUNC(refill);
        };
    } else {
        GVAR(water) = GVAR(water) - _decent;
    };
} else {
    GVAR(food) = GVAR(food) - GVAR(food_decent_rate);

    if(([] call FUNC(hasCamelbak)) && ((GVAR(camelbak) - _decent) >= 0)) then {
        GVAR(camelbak) = GVAR(camelbak) - GVAR(water_decent_rate);

        if(GVAR(water) < 100) then {
            [nil, nil, 2] call FUNC(refill);
        };
    } else {
        GVAR(water) = GVAR(water) - GVAR(water_decent_rate);
    };
};

if (GVAR(water) < 20) then {
    hint "I am feeling thirsty";
};

if (GVAR(food) < 20) then {
    hint "I am feeling hungry";
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