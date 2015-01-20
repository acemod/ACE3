/*
	fnc_getExplosionIndex.sqf

	Author: Garth de Wet (LH)

	Description:
	Turns 0-1 damage into a rating system of 0-3

	Parameters:
	0: NUMBER - The amount of damage

	Returns:
	NUMBER (the rating) [0-3]

	Example:
	_rating = 0.05 call FUNC(GetExplosionIndex);
*/
private ["_effectIndex"];

_effectIndex = switch true do {
   	case (_this <= 0.04): {0};
   	case (_this <= 0.06): {1};
   	case (_this <= 0.09): {2};
   	default {3};
};

_effectIndex
