#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Custom wounds handler for armor penetration. Calculates damage based on round material penetration and unit armor
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 * 3: Projectile classname <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body", 1]], "bullet"] call ace_medical_damage_fnc_woundsHandlerArmorPenetration
 *
 * Public: No
 */

// armor 2 with passthrough 0.8
#define SCALED_UNPROTECTED_VALUE 4
#define ENGINE_DAMAGE_INDEX 0

// This gets close to vanilla values on FMJ ammo
#define DAMAGE_SCALING_FACTOR 10

// Based off #9216 armor values for vanilla vests
#define ARMOR_LEVEL_1_CAP 12
#define ARMOR_LEVEL_2_CAP 14
#define ARMOR_LEVEL_3_CAP 16
#define ARMOR_LEVEL_4_CAP 20

params ["_unit", "_allDamages", "_typeOfDamage", ["_ammo", ""]];
TRACE_3("woundsHandlerArmorPenetration",_unit,_allDamages,_typeOfDamage);

if !(EGVAR(medical,alternateArmorPenetration) && {_ammo isNotEqualTo ""}) exitWith {_this};

private _damageData = (_allDamages select 0); // selection specific
_damageData params ["_engineDamage", "", "_realDamage"];

private _armor = (_realDamage/_engineDamage) - SCALED_UNPROTECTED_VALUE;
// There's no need to calculate penetration if there is no armor to begin with, vanilla damage handling is good enough in this case
if (_armor <= 0) exitWith {
    _this // return
};

// Armor RHA equivalent, non-linear, ref \a3\Data_F\Penetration\armour_plate/thin/medium/heavy.bisurf
// Divided by 2 to keep inline with vanilla caliber values
// Excedent armor over the cap gets added as a small bonus to thickness
private _armorThickness = _armor/2;
switch (true) do {
    case (_armor >= ARMOR_LEVEL_4_CAP): {
        _armorThickness = 55 - (ARMOR_LEVEL_4_CAP - _armor);
    };
    case (_armor >= ARMOR_LEVEL_3_CAP): {
        _armorThickness = 40 - (ARMOR_LEVEL_3_CAP - _armor);
    };
    case (_armor >= ARMOR_LEVEL_2_CAP): {
        _armorThickness = 15 - (ARMOR_LEVEL_2_CAP - _armor);
    };
    case (_armor >= ARMOR_LEVEL_1_CAP): {
        _armorThickness = 6 - (ARMOR_LEVEL_1_CAP - _armor);
    };
};

// See (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber),
// _penFactor is ammo "caliber" * RHA penetrability, armor plates according to BI are just made of RHA with different thickness
([_ammo] call FUNC(getAmmoData)) params ["_hit", "_penFactor", "_typicalSpeed"];

// Impact damage is hit * (impactSpeed / typicalSpeed): https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#typicalSpeed
// Impact damage is already lowered by engine based on hit angle, so speed and therefore penetration are also naturally lowered
private _impactSpeed = (_realDamage/_hit) * _typicalSpeed;

private _penDepth = _penFactor * _impactSpeed;

// We want to base damage on the round's energy and armor penetration exclusively, so we'll use the config value to get damage
// There's only so much damage a round can do, limited by its energy
private _finalDamage = (_hit * ((_penDepth/_armorThickness) min 1)) / DAMAGE_SCALING_FACTOR;
_damageData set [ENGINE_DAMAGE_INDEX, _finalDamage];

TRACE_3("Armor penetration handled, passing damage",_finalDamage,_damageData,_allDamages);

_this // return
