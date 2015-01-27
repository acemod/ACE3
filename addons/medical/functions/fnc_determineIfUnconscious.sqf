/**
 * fn_determineIfUnconscious.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_part","_damageThreshold"];
_unit = _this select 0;
_part = _this select 1;

if (!alive _unit) exitwith { true };

if ((vehicle _unit != _unit) && {!alive (vehicle _unit)}) exitwith { true };

// Find the correct Damage threshold for unit.
_damageThreshold = if (isPlayer _unit) then {
    missionNamespace getvariable[QGVAR(unitDamageThreshold), [GVAR(damageThreshold_Players), GVAR(damageThreshold_Players), GVAR(damageThreshold_Players)]];
} else {
    missionNamespace getvariable[QGVAR(unitDamageThreshold), [GVAR(damageThreshold_AI), GVAR(damageThreshold_AI), GVAR(damageThreshold_AI)]];
};

_damageBodyPart = ([_unit,QGVAR(bodyPartStatus),[0,0,0,0,0,0]] call EFUNC(common,getDefinedVariable)) select _part;

// Check if damage to body part is higher as damage head
if (_part == 0) exitwith {
    ((_damageBodyPart * GVAR(setting_medicalDifficulty)) >= ((_damageThreshold select 0) * 0.7) && {(random(1) > 0.35)});
};

// Check if damage to body part is higher as damage torso
if (_part == 1) exitwith {
    ((_damageBodyPart * GVAR(setting_medicalDifficulty)) >= ((_damageThreshold select 1) * 0.5) && {(random(1) > 0.4)});
};
// Check if damage to body part is higher as damage limbs
((_damageBodyPart * GVAR(setting_medicalDifficulty)) >= ((_damageThreshold select 2) * 0.8) && {(random(1) > 0.7)});