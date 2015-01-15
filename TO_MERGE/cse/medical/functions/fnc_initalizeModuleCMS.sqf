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

GVAR(setting_AdvancedLevel) = 2;
GVAR(setting_allowInstantDead) = true;
GVAR(setting_advancedWoundsSetting) = true;
GVAR(setting_advancedMedicRoles) = false;
GVAR(setting_enableBandagingAid) = false;
GVAR(setting_allowAIFullHeal) = false;
GVAR(setting_allowAirwayInjuries) = false;
GVAR(setting_removeAidKitOnUse) = false;
GVAR(setting_enableForUnits) = 1;
GVAR(setting_aidKitRestrictions) = 0;
GVAR(setting_aidKitMedicsOnly) = false;
GVAR(setting_allowVehicleCrashInjuries) = true;
GVAR(setting_allowStitching) = 0;

// Damage thresholds only in case the damge threshold module hasn't been placed down.
if (isnil QGVAR(damageThreshold_AI)) then {
	GVAR(damageThreshold_AI) = 1;
};

if (isnil QGVAR(damageThreshold_Players)) then {
	GVAR(damageThreshold_Players) = 1;
};


// TODO implement this into a switch structure.
{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "advancedLevel") exitwith {
			GVAR(setting_AdvancedLevel) = _x select 1;
		};
		if (_x select 0 == "openingOfWounds") exitwith {
			GVAR(setting_advancedWoundsSetting) = _x select 1;
		};
		if (_x select 0 == "medicSetting") exitwith {
			GVAR(setting_advancedMedicRoles) = _x select 1;
		};
		if (_x select 0 == "difficultySetting") exitwith {
			GVAR(setting_medicalDifficulty) = _x select 1;
		};
		if (_x select 0 == "bandagingAid") exitwith {
			GVAR(setting_enableBandagingAid) = _x select 1;
		};
		if (_x select 0 == "allowAIFullHeal") exitwith {
			GVAR(setting_allowAIFullHeal) = _x select 1;
		};
		if (_x select 0 == "enableFor") exitwith {
			GVAR(setting_enableForUnits) = _x select 1;
		};
		if (_x select 0 == "enableAirway") exitwith {
			GVAR(setting_allowAirwayInjuries) = (_x select 1) == 1;
		};
		if (_x select 0 == "aidKitRestrictions") exitwith {
			GVAR(setting_aidKitRestrictions) = _x select 1;
		};
		if (_x select 0 == "aidKitUponUsage") exitwith {
			GVAR(setting_removeAidKitOnUse) = _x select 1;
		};
		if (_x select 0 == "aidKitMedicsOnly") exitwith {
			GVAR(setting_aidKitMedicsOnly) = _x select 1;
		};
		if (_x select 0 == "bandageTime") exitwith {
			GVAR(setting_bandageWaitingTime) = _x select 1;
		};
		if (_x select 0 == "vehCrashes") exitwith {
			GVAR(setting_allowVehicleCrashInjuries) = _value;
		};
		if (_x select 0 == "stitchingMedicsOnly") exitwith {
			GVAR(setting_allowStitching) = _value;
		};
	};
}foreach _args;

if (GVAR(setting_AdvancedLevel) == -1) exitwith{};
call compile preprocessFile QUOTE(PATHTOF(functions.sqf));
GVAR(isEnabled) = true;

[
	{(([_this select 0,QGVAR(heartRate)] call EFUNC(common,getDefinedVariable)) < 20)},
	{(([_this select 0,QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) < 65)},
	{(([_this select 0,QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable)) > 48)}
] call EFUNC(common,registerUnconsciousCondition);

if (GVAR(setting_allowAirwayInjuries)) then {
	[
		{(([_this select 0,QGVAR(airway)] call EFUNC(common,getDefinedVariable)) > 2)}
	] call EFUNC(common,registerUnconsciousCondition);
};

waituntil{!isnil "ace_gui"};

GVAR(MEDICAL_COMBINED_LOOP) = [];
waituntil{!isnil "ace_gui" && !isnil "ace_main"};
GVAR(task_pool_lastTime) = time;

FUNC(taskLoopCode) = {
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
 false; };

GVAR(cms_taskLoop_trigger) = createTrigger["EmptyDetector", [0,0,0]];
GVAR(cms_taskLoop_trigger) setTriggerActivation ["NONE", "PRESENT", true];
GVAR(cms_taskLoop_trigger) setTriggerStatements[QUOTE(call FUNC(taskLoopCode)), "", ""];

if (!hasInterface) exitwith{};
[player] spawn {
	disableSerialization;
	_CMSFadingBlackUI = uiNamespace getVariable QGVAR(ScreenEffectsBlack);
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

