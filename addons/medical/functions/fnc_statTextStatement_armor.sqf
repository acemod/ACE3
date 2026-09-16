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

// Use the same classification the armor penetration model uses, so the arsenal can't disagree
// with what actually happens when the wearer gets shot
private _itemType = getNumber (_config >> "ItemInfo" >> "type");
private _hitpoint = ["HitChest", "HitHead"] select (_itemType == TYPE_HEADGEAR);

([configName _config, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_armorLevel"];

// Levels are continuous (a blend of the armor and passThrough readings), round for display
_armorLevel = 0 max (round _armorLevel) min MAX_PLATE_LEVEL;

localize ([
    "STR_A3_SP_NOARMOR",
    "STR_A3_SP_AL_I",
    "STR_A3_SP_AL_II",
    "STR_A3_SP_AL_III",
    "STR_A3_SP_AL_IV",
    "STR_A3_SP_AL_V"
] select _armorLevel)
