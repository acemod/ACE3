/*
init.sqf
Usage:
Author: Glowbal

Arguments:
Returns:

Affects: Local
Executes: call
*/

private ["_args"];
_args = _this;

CSE_DAMAGE_THRESHOLD_AI_DMG = 1;
CSE_DAMAGE_THRESHOLD_PLAYERS_DMG = 1;
{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "damageThresholdAI") exitwith {
			CSE_DAMAGE_THRESHOLD_AI_DMG = _x select 1;
		};
		if (_x select 0 == "damageThresholdPlayers") exitwith {
			CSE_DAMAGE_THRESHOLD_PLAYERS_DMG = _x select 1;
		};
	};
}foreach _args;


waituntil {!isnil "cse_main"};
["cse_damageBodypart_DMG", 0, false, "dmg"] call cse_fnc_defineVariable;
["cse_damageBodypartPrevious_DMG", 0, false, "dmg"] call cse_fnc_defineVariable;

