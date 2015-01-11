/*
	Name: AGM_Goggles_fnc_GetExplosionIndex
	
	Author: Garth de Wet (LH)
	
	Description:
	Turns 0-1 damage into a rating system of 0-3
	
	Parameters: 
	0: NUMBER - The amount of damage
	
	Returns:
	NUMBER (the rating) [0-3]
	
	Example:
	_rating = 0.05 call AGM_Goggles_fnc_GetExplosionIndex
*/
private ["_effect", "_effectIndex"];
_effect = _this;

_effectIndex = switch true do {
   	case (_effect <= 0.04): {0};
   	case (_effect <= 0.06): {1};
   	case (_effect <= 0.09): {2};
   	default {3};
};

_effectIndex
