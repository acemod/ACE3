CSE_BACKBLAST_AFFECTS_INBUILDING_BB = false;
CSE_BACKBLAST_EFFECT_AI_BB = false;
CSE_BACKBLAST_AFFECTS_ADVANCED_BB = false;
CSE_BACKBLAST_DAMAGE_MODIFIER_BB = 0.5;
private ["_args"];
_args = _this;

{
	if (_x select 0 == "inBuilding") then {
		CSE_BACKBLAST_AFFECTS_INBUILDING_BB = _x select 1;
	};
	if (_x select 0 == "forAI") then {
		CSE_BACKBLAST_EFFECT_AI_BB = _x select 1;
	};
	if (_x select 0 == "damageModifier") then {
		CSE_BACKBLAST_DAMAGE_MODIFIER_BB = _x select 1;
	};
	if (_x select 0 == "advanced") then {
		CSE_BACKBLAST_AFFECTS_ADVANCED_BB = _x select 1;
	};
}foreach _args;