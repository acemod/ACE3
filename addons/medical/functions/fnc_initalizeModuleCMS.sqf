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
GVAR(setting_AdvancedLevel) = _logic getvariable["advancedLevel", 0];
GVAR(setting_advancedWoundsSetting) = _logic getvariable["openingOfWounds", true];
GVAR(setting_advancedMedicRoles) = _logic getvariable["medicSetting", false];
GVAR(setting_medicalDifficulty) = _logic getvariable["difficultySetting", 1];
GVAR(setting_enableBandagingAid) = _logic getvariable["bandagingAid", GVAR(setting_AdvancedLevel) == 0];
GVAR(setting_allowAIFullHeal) = _logic getvariable["allowAIFullHeal", false];
GVAR(setting_enableForUnits) = _logic getvariable["enableFor", 1];
GVAR(setting_allowAirwayInjuries) = (_logic getvariable["enableAirway", 0]) == 1;
GVAR(setting_aidKitRestrictions) = _logic getvariable["aidKitRestrictions", 0];
GVAR(setting_removeAidKitOnUse) = _logic getvariable["aidKitUponUsage", false];
GVAR(setting_aidKitMedicsOnly) = _logic getvariable["aidKitMedicsOnly", false];
GVAR(setting_bandageWaitingTime) = _logic getvariable["bandageTime", 5];
GVAR(setting_allowVehicleCrashInjuries) = _logic getvariable["vehCrashes", true];
GVAR(setting_allowStitching) = _logic getvariable["stitchingMedicsOnly", 0];

if (GVAR(setting_AdvancedLevel) == -1) exitwith{};
GVAR(isEnabled) = true;


waituntil{!isnil "ACE_gui" && !isnil "ACE_common"};


if (GVAR(setting_AdvancedLevel) > 0) then {
    [
        {(([_this select 0,QGVAR(heartRate)] call EFUNC(common,getDefinedVariable)) < 20)}
    ] call FUNC(registerUnconsciousCondition);

    if (GVAR(setting_allowAirwayInjuries)) then {
        [
            {(([_this select 0,QGVAR(airway)] call EFUNC(common,getDefinedVariable)) > 2)}
        ] call FUNC(registerUnconsciousCondition);
    };
};

if (!hasInterface) exitwith{};

{
    if(_x == "FirstAidKit" || {_x == "Medikit"}) then {
        player removeItem _x;
    };
}foreach (items player);

