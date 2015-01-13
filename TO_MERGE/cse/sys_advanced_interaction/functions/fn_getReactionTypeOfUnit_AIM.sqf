/**
 * fn_getReactionTypeOfUnit_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target","_caller","_stanceTowardsPlayerSide","_possibleReactionTypes","_selectedReactionType", "_selectNewReactionType", "_oldStance"];
_target = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_caller = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;

_stanceTowardsPlayerSide = switch (side _caller) do {
	case WEST: {cse_stance_systemBlufor};
	case EAST: {cse_stance_systemOpfor};
	case independent: {cse_stance_systemRes};
	default {0};
};
if (side _caller == side _target) then {
	_stanceTowardsPlayerSide = 500;
};

_selectNewReactionType = false;
_reactionType = _target getvariable "CSE_SYS_AIM_REACTION_TYPE";
if (isnil "_reactionType") then {
	_selectNewReactionType = true;
} else {
	_oldStance = _reactionType select 1;
	if (abs(_oldStance - _stanceTowardsPlayerSide) > 50) then {
		_selectNewReactionType = true;
		["Need to refresh stance"] call cse_fnc_debug;
	} else {
		_selectedReactionType = _reactionType select 0;
	};
};

if (_selectNewReactionType) then {
	_possibleReactionTypes = switch (true) do {
		case (_stanceTowardsPlayerSide > 200): {
			["friendly", "neutral", "careless"];
		};
		case (_stanceTowardsPlayerSide > 0 ): {
	 		 ["agressive", "friendly", "neutral", "careless"];
		};
		case (_stanceTowardsPlayerSide < -500): {
			["agressive", "hostile"];
		};
		default {
			["agressive", "careless", "hostile", "neutral"];
		};
	};

	_selectedReactionType = (_possibleReactionTypes select round (random (count _possibleReactionTypes - 1)));
	_target setvariable ["CSE_SYS_AIM_REACTION_TYPE",[_selectedReactionType, _stanceTowardsPlayerSide]];
};
_selectedReactionType