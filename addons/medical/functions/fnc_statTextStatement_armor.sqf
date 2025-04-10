#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Text statement for armor.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["_config"];

private _itemType = getNumber (_config >> "ItemInfo" >> "type");

private _hitpoint = ["HitChest", "HitHead"] select (_itemType == TYPE_HEADGEAR);
private _levelStep = [4, 2] select (_itemType == TYPE_HEADGEAR);

([configName _config, _hitpoint] call EFUNC(medical_engine,getItemArmor)) params ["_armor", "_armorScaled"];

if (_armor > (_armorScaled * 2)) then { // Probably explosive-resistant armor
    _armor = _armorScaled;
};

private _armorLevel = 0 max (round ((_armor - _levelStep) / _levelStep)) min 5;

localize ([
    "STR_A3_SP_NOARMOR",
    "STR_A3_SP_AL_I",
    "STR_A3_SP_AL_II",
    "STR_A3_SP_AL_III",
    "STR_A3_SP_AL_IV",
    "STR_A3_SP_AL_V"
] select _armorLevel)
