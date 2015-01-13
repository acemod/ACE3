/**
 * fn_onCivilianKilled_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_killer","_victem"];
_killer = _this select 0;
_victem = _this select 1;
if (side _victem == civilian) then {
	if (CSE_ENABLED_DIALOG_INTERACTION_AIM && {isPlayer _killer} && {local _victem}) then {
		switch (side _killer) do {
			case WEST: {cse_stance_systemBlufor = cse_stance_systemBlufor - (random 300); publicVariable "cse_stance_systemBlufor";};
			case EAST: { cse_stance_systemOpfor = cse_stance_systemOpfor - (random 300); publicVariable "cse_stance_systemOpfor";};
			case independent: {cse_stance_systemRes = cse_stance_systemRes - (random 300); publicVariable "cse_stance_systemRes";};
			default {};
		};
	};
};