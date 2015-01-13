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

CSE_ADVANCED_LEVEL_CMS = 2;
CSE_ALLOW_INSTANT_DEAD_CMS = true;
CSE_ADVANCED_WOUNDS_SETTING_CMS = true;
CSE_ADVANCED_MEDICAL_ROLES_CMS = false;
CSE_BANDAGING_AID_CMS = false;
CSE_ALLOW_AI_FULL_HEAL_CMS = false;
CSE_ALLOW_AIRWAY_INJURIES_CMS = false;
CSE_AID_KIT_REMOVED_UPON_USAGE_CMS = false;
CSE_ENABLE_SETTING_FORUNITS_CMS = 1;
CSE_AID_KIT_RESTRICTIONS_CMS = 0;
CSE_AIDKITMEDICSONLY_CMS = false;
CSE_ALLOW_VEH_CRASH_INJURIES_CMS = true;
CSE_STITCHING_ALLOW_CMS = 0;

// damage thresholds only in case the damge threshold module hasn't been placed down.
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
			CSE_ALLOW_AIRWAY_INJURIES_CMS = (_x select 1) == 1;
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
waituntil {!isnil "cse_main"};
#include "variable_defines.sqf"


[
	{(([_this select 0,"cse_heartRate"] call cse_fnc_getVariable) < 20)},
	{(([_this select 0,"cse_bloodVolume"] call cse_fnc_getVariable) < 65)},
	{(([_this select 0,"cse_pain"] call cse_fnc_getVariable) > 48)}
] call cse_fnc_registerUnconsciousCondition;

if (CSE_ALLOW_AIRWAY_INJURIES_CMS) then {
	[
		{(([_this select 0,"cse_airway"] call cse_fnc_getVariable) > 2)}
	] call cse_fnc_registerUnconsciousCondition;
};

/*
[
	{([_this select 0,"cse_cardiacArrest_CMS"] call cse_fnc_getVariable)}
] call cse_fnc_registerUnconsciousCondition;
*/

cse_sys_medical = true;

waituntil{!isnil "cse_gui"};
#include "init_UI_options.sqf";
#include "init_UI_actions.sqf";

if (isnil "CSE_MEDICAL_COMBINED_LOOP_CMS") then {
	CSE_MEDICAL_COMBINED_LOOP_CMS = [];
};

waituntil{!isnil "cse_gui" && !isnil "cse_main"};
cse_sys_medical_task_pool_CMS_lastTime = time;
_cms_taskLoop = '
	if ((time - cse_sys_medical_task_pool_CMS_lastTime) >= 1 || true) then {
		cse_sys_medical_task_pool_CMS_lastTime = time;
		{
			if (!alive _x || !local _x) then {
				CSE_MEDICAL_COMBINED_LOOP_CMS set [ _forEachIndex, ObjNull];
			} else {
				[_x] call cse_fnc_updateVitals_CMS;
				_pain = _X getvariable ["cse_pain", 0];
				if (_pain > 5 && (random(1) > 0.5)) then {
					_x setvariable ["cse_pain", _pain + 0.002];
				};
				if (_pain > 45) then {
					if (random(1) > 0.6) then {
						[_X] call cse_fnc_setUnconsciousState;
					};
					[_X] spawn cse_fnc_playInjuredSound_CMS;
				};
			};
		}foreach CSE_MEDICAL_COMBINED_LOOP_CMS;
		CSE_MEDICAL_COMBINED_LOOP_CMS = CSE_MEDICAL_COMBINED_LOOP_CMS - [ObjNull];
	};
 false; ';

cse_sys_medical_cms_taskLoop_trigger = createTrigger["EmptyDetector", [0,0,0]];
cse_sys_medical_cms_taskLoop_trigger setTriggerActivation ["NONE", "PRESENT", true];
cse_sys_medical_cms_taskLoop_trigger setTriggerStatements[_cms_taskLoop, "", ""];

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
	[_this select 0] spawn cse_fnc_effectsLoop_CMS;


	// This is here for backwards compatability. This code will be removed in the near future.
	_showError = false;
	{
		_configEntry = (configFile >> "CfgMagazines" >> _x);
		if([_configEntry, "cse_backwardsCompatMagazineBase_CMS"] call cse_fnc_inheritsFrom) then {
			player removeMagazine _x;
			player addItem _x;
			diag_log format["WARNING: Outdated CMS magazine classname %1 found. Please replace magazine by item variant. Future versions will not support this anymore.", _x];
			_showError = true;
		};
	}foreach (magazines player);
	if (_showError) then {
		["Outdated CMS Classnames have been found. Please replace magazine classname by item variant. Future versions will not support magazine variant"] call BIS_fnc_error;
	};
};
CSE_DISPLAY_ADDITIONAL_HINTS_CMS = false;


["cse_sys_medical_allowSharedEquipment", ["Disable", "Anyone", "Side Only", "Group Only"], (["cse_sys_medical_allowSharedEquipment", 0] call cse_fnc_getClientSideOptionFromProfile_F), {
	[_this] call cse_fnc_debug;
	switch (_this select 1) do {
		case (1): {player setvariable ["cse_allowSharedEquipmentAccess_CMS", 0, true]};
		case (2): {player setvariable ["cse_allowSharedEquipmentAccess_CMS", 1, true]};
		case (3): {player setvariable ["cse_allowSharedEquipmentAccess_CMS", 2, true]};
		default {player setvariable ["cse_allowSharedEquipmentAccess_CMS", -1, true]};
	};
}] call cse_fnc_addClientSideOptions_f;

["cse_sys_medical_allowSharedEquipment","option","Shared Medical Equipment","Set your access level for sharing medical equipment with other players."] call cse_fnc_settingsDefineDetails_F;
