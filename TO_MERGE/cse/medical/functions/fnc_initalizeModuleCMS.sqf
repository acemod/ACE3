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

private ["_logic"];
_logic = _this select 0;

if (isNull _logic) exitwith {};

// Damage thresholds only in case the damge threshold module hasn't been placed down.
if (isnil QGVAR(damageThreshold_AI)) then {
	GVAR(damageThreshold_AI) = 1;
};

if (isnil QGVAR(damageThreshold_Players)) then {
	GVAR(damageThreshold_Players) = 1;
};

GVAR(setting_allowInstantDead) = _logic getvariable["setting_allowInstantDead", true];
GVAR(setting_AdvancedLevel) = _logic getvariable["advancedLevel", 2];
GVAR(setting_advancedWoundsSetting) = _logic getvariable["openingOfWounds", true];
GVAR(setting_advancedMedicRoles) = _logic getvariable["medicSetting", false];
GVAR(setting_medicalDifficulty) = _logic getvariable["difficultySetting", ];
GVAR(setting_enableBandagingAid) = _logic getvariable["bandagingAid", 0];
GVAR(setting_allowAIFullHeal) = _logic getvariable["allowAIFullHeal", false];
GVAR(setting_enableForUnits) = _logic getvariable["enableFor", 1];
GVAR(setting_allowAirwayInjuries) = _logic getvariable["enableAirway", false];
GVAR(setting_aidKitRestrictions) = _logic getvariable["aidKitRestrictions", 0];
GVAR(setting_removeAidKitOnUse) = _logic getvariable["aidKitUponUsage", false];
GVAR(setting_aidKitMedicsOnly) = _logic getvariable["aidKitMedicsOnly", false];
GVAR(setting_bandageWaitingTime) = _logic getvariable["bandageTime", 5];
GVAR(setting_allowVehicleCrashInjuries) = _logic getvariable["vehCrashes", true];
GVAR(setting_allowStitching) = _logic getvariable["stitchingMedicsOnly", 0];

if (GVAR(setting_AdvancedLevel) == -1) exitwith{};
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

waituntil{!isnil "ACE_gui" && !isnil "ACE_common"};
GVAR(task_pool_lastTime) = time;
GVAR(MEDICAL_COMBINED_LOOP) = [];

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

