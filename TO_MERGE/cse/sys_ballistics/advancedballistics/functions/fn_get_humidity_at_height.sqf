#include "defines.h"

private ["_fogValue", "_fogDecay", "_fogBase"];

if (cse_AB_Humidity < 1 && fog > 0) then {
	_fogValue = fogParams select 0;
	_fogDecay = fogParams select 1;
	_fogBase = fogParams select 2;
	_fogDensity = 1 - 0.05 * (_fogDecay / _fogValue * (_this - _fogBase))^2;
	if (_fogDensity > 0) then {
		1
	} else {
		cse_AB_Humidity + (1 - cse_AB_Humidity) * (0 max (1 + _fogDensity))
	};
} else {
	cse_AB_Humidity
};
