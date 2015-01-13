/*
init.sqf
Usage:
Author: Glowbal

Arguments:
Returns:

Affects: Local
Executes: call
*/

#include "script_component.hpp"

private ["_args"];
_args = _this;

CSE_ADVANCED_LEVEL_CMS = 2;
CSE_ALLOW_INSTANT_DEAD_CMS = true;
CSE_ADVANCED_WOUNDS_SETTING_CMS = true;
CSE_ADVANCED_MEDICAL_ROLES_CMS = false;
CSE_BANDAGING_AID_CMS = false;
CSE_ALLOW_AI_FULL_HEAL_CMS = false;
GVAR(ALLOW_AIRWAY_INJURIES) = false;
CSE_AID_KIT_REMOVED_UPON_USAGE_CMS = false;
CSE_ENABLE_SETTING_FORUNITS_CMS = 1;
CSE_AID_KIT_RESTRICTIONS_CMS = 0;
CSE_AIDKITMEDICSONLY_CMS = false;
CSE_ALLOW_VEH_CRASH_INJURIES_CMS = true;
CSE_STITCHING_ALLOW_CMS = 0;

// Damage thresholds only in case the damge threshold module hasn't been placed down.
if (isnil "CSE_DAMAGE_THRESHOLD_AI_DMG") then {
	CSE_DAMAGE_THRESHOLD_AI_DMG = 1;
};

if (isnil "CSE_DAMAGE_THRESHOLD_PLAYERS_DMG") then {
	CSE_DAMAGE_THRESHOLD_PLAYERS_DMG = 1;
};


// TODO implement this into a switch structure.
{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "advancedLevel") exitwith {
			CSE_ADVANCED_LEVEL_CMS = _x select 1;
		};
		if (_x select 0 == "openingOfWounds") exitwith {
			CSE_ADVANCED_WOUNDS_SETTING_CMS = _x select 1;
		};
		if (_x select 0 == "medicSetting") exitwith {
			CSE_ADVANCED_MEDICAL_ROLES_CMS = _x select 1;
		};
		if (_x select 0 == "difficultySetting") exitwith {
			CSE_MEDICAL_DIFFICULTY = _x select 1;
		};
		if (_x select 0 == "bandagingAid") exitwith {
			CSE_BANDAGING_AID_CMS = _x select 1;
		};
		if (_x select 0 == "allowAIFullHeal") exitwith {
			CSE_ALLOW_AI_FULL_HEAL_CMS = _x select 1;
		};
		if (_x select 0 == "enableFor") exitwith {
			CSE_ENABLE_SETTING_FORUNITS_CMS = _x select 1;
		};
		if (_x select 0 == "enableAirway") exitwith {
			GVAR(ALLOW_AIRWAY_INJURIES) = (_x select 1) == 1;
		};
		if (_x select 0 == "aidKitRestrictions") exitwith {
			CSE_AID_KIT_RESTRICTIONS_CMS = _x select 1;
		};
		if (_x select 0 == "aidKitUponUsage") exitwith {
			CSE_AID_KIT_REMOVED_UPON_USAGE_CMS = _x select 1;
		};
		if (_x select 0 == "aidKitMedicsOnly") exitwith {
			CSE_AIDKITMEDICSONLY_CMS = _x select 1;
		};
		if (_x select 0 == "bandageTime") exitwith {
			CSE_BANDAGE_WAITING_TIME_CMS = _x select 1;
		};
		if (_x select 0 == "vehCrashes") exitwith {
			CSE_ALLOW_VEH_CRASH_INJURIES_CMS = _value;
		};
		if (_x select 0 == "stitchingMedicsOnly") exitwith {
			CSE_STITCHING_ALLOW_CMS = _value;
		};
	};
}foreach _args;

if (CSE_ADVANCED_LEVEL_CMS == -1) exitwith{};
call compile preprocessFile "cse\cse_sys_medical\functions.sqf";
CSE_SYS_MEDICAL_SYSTEM_ENABLED_TAGS = true;

#include "variable_defines.sqf"

[
	{(([_this select 0,QGVAR(heartRate)] call EFUNC(common,getDefinedVariable)) < 20)},
	{(([_this select 0,QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) < 65)},
	{(([_this select 0,QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable)) > 48)}
] call cse_fnc_registerUnconsciousCondition;

if (GVAR(ALLOW_AIRWAY_INJURIES)) then {
	[
		{(([_this select 0,QGVAR(airway)] call EFUNC(common,getDefinedVariable)) > 2)}
	] call cse_fnc_registerUnconsciousCondition;
};
cse_sys_medical = true;

waituntil{!isnil "ace_gui"};

GVAR(MEDICAL_COMBINED_LOOP) = [];
waituntil{!isnil "ace_gui" && !isnil "ace_main"};
GVAR(task_pool_lastTime) = time;
_cms_taskLoop = '
	if ((time - GVAR(task_pool_lastTime)) >= 1 || true) then {
		GVAR(task_pool_lastTime) = time;
		{
			if (!alive _x || !local _x) then {
				GVAR(MEDICAL_COMBINED_LOOP) set [ _forEachIndex, ObjNull];
			} else {
				[_x] call FUNC(updateVitals_CMS);
				_pain = _X getvariable [QGVAR(amountOfPain), 0];
				if (_pain > 5 && (random(1) > 0.5)) then {
					_x setvariable [QGVAR(amountOfPain), _pain + 0.002];
				};
				if (_pain > 45) then {
					if (random(1) > 0.6) then {
						[_X] call EFUNC(common,setUnconsciousState);
					};
					[_X] spawn FUNC(playInjuredSound_CMS);
				};
			};
		}foreach GVAR(MEDICAL_COMBINED_LOOP);
		GVAR(MEDICAL_COMBINED_LOOP) = GVAR(MEDICAL_COMBINED_LOOP) - [ObjNull];
	};
 false; ';

GVAR(cms_taskLoop_trigger) = createTrigger["EmptyDetector", [0,0,0]];
GVAR(cms_taskLoop_trigger) setTriggerActivation ["NONE", "PRESENT", true];
GVAR(cms_taskLoop_trigger) setTriggerStatements[_cms_taskLoop, "", ""];

if (!hasInterface) exitwith{};
[player] spawn {
	disableSerialization;
	_CMSFadingBlackUI = uiNamespace getVariable "CMSFadingBlackUI";
	if (!isnil "_CMSFadingBlackUI") then {
		_ctrlFadingBlackUI = _CMSFadingBlackUI displayCtrl 11112;
		2 fadeSound 1;
		_ctrlFadingBlackUI ctrlSetTextColor [0.0,0.0,0.0,0.0];
	};
	{
		if(_x == "FirstAidKit" || {_x == "Medikit"}) then {
			player removeItem _x;
		};
	}foreach (items player);
	[_this select 0] spawn FUNC(effectsLoop_CMS);
};

