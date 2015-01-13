/**
 * fn_healLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_caller", "_wasUnconscious"];
_unit = _this select 0;
_caller = _this select 1;

if (alive _unit) then {
	_wasUnconscious = [_unit] call cse_fnc_isUnconscious;
	[_unit,"treatment",format["%1 used a personal aid kit",[_caller] call cse_fnc_getName]] call cse_fnc_addActivityToLog_CMS;

	[_unit,"cse_openWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call cse_fnc_setVariable;
	[_unit,"cse_bandagedWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call cse_fnc_setVariable;
	[_unit,"cse_fractures",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call cse_fnc_setVariable;
	[_unit,"cse_airway",0] call cse_fnc_setVariable;
	[_unit,"cse_tourniquets",[0,0,0,0,0,0]] call cse_fnc_setVariable;
	[_unit,"cse_splints",0] call cse_fnc_setVariable;

	//["cse_activityLog_CMS",[]] call cse_fnc_setVariable;
	[_unit,"cse_triageLevel",0] call cse_fnc_setVariable;
	[_unit,"cse_triageCard",[]] call cse_fnc_setVariable;

	// private variables
	[_unit,"cse_bloodVolume",100] call cse_fnc_setVariable;
	[_unit,"cse_bloodIVVolume",0] call cse_fnc_setVariable;
	[_unit,"cse_plasmaIVVolume",0] call cse_fnc_setVariable;
	[_unit,"cse_salineIVVolume",0] call cse_fnc_setVariable;

	[_unit,"cse_pain",0] call cse_fnc_setVariable;
	[_unit,"cse_heartRate",80] call cse_fnc_setVariable;
	[_unit,"cse_andrenaline",0] call cse_fnc_setVariable;
	[_unit,"cse_bloodPressure",[80,120]] call cse_fnc_setVariable;

	[_unit,"cse_givenMorphine",0] call cse_fnc_setVariable;
	[_unit,"cse_givenAtropine",0] call cse_fnc_setVariable;
	[_unit,"cse_givenEpinephrine",0] call cse_fnc_setVariable;

	[_unit,"cse_bodyPartStatus",[0,0,0,0,0,0]] call cse_fnc_setVariable;
	[_unit,"CSE_ENABLE_REVIVE_SETDEAD_F", 0] call cse_fnc_setVariable;
	[_unit,"CSE_ENABLE_REVIVE_COUNTER", 0] call cse_fnc_setVariable;

	_unit setDamage 0;
	if (!CSE_ALLOW_INSTANT_DEAD_CMS) then {
		[_unit, "cse_noInstantDeath", false] call cse_fnc_setVariable;
	};

	if (isPlayer _unit) then {
		[false] call cse_fnc_effectBlackOut;
		[true] call cse_fnc_setVolume_f;
		["unconscious", false] call cse_fnc_disableUserInput_f;
	};
	if (_wasUnconscious) then {
		["waiting until no longer unconscious"] call cse_fnc_debug;
		waituntil {!([_unit] call cse_fnc_isUnconscious)};
		sleep 0.1;

		if (vehicle _unit == _unit) then {
			if (!([_unit] call cse_fnc_beingCarried)) then {
				["Resetting animation"] call cse_fnc_debug;
				[_unit,"",false] call cse_fnc_broadcastAnim;
				[_unit,"amovppnemstpsnonwnondnon",false] call cse_fnc_broadcastAnim;
			};
		};
	};
	["Completed healLocal"] call cse_fnc_debug;
};
