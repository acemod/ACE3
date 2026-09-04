#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Bar statement for armor.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 *
 * Return Value:
 * Bar statement <NUMBER>
 *
 * Public: No
*/

params ["_config"];

// Use the same classification the armor penetration model uses, so the arsenal can't disagree
// with what actually happens when the wearer gets shot
private _itemType = getNumber (_config >> "ItemInfo" >> "type");
private _isHeadgear = _itemType == TYPE_HEADGEAR;

private _hitpoint = ["HitChest", "HitHead"] select _isHeadgear;
// Ceilings are equal today, but headgear is rated against different threats than plates, so keep
// the bar normalised per type in case they diverge again
private _maxLevel = [MAX_PLATE_LEVEL, MAX_HELMET_LEVEL] select _isHeadgear;

([configName _config, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_armorLevel"];

0.01 max (_armorLevel / _maxLevel) min 1
