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

private _itemType = getNumber (_config >> "ItemInfo" >> "type");

private _hitpoint = ["HitChest", "HitHead"] select (_itemType == TYPE_HEADGEAR);
private _levelStep = [4, 2] select (_itemType == TYPE_HEADGEAR);

([configName _config, _hitpoint] call EFUNC(medical_engine,getItemArmor)) params ["_armor", "_armorScaled"];

if (_armor > (_armorScaled * 2)) then { // Probably explosive-resistant armor
    _armor = _armorScaled;
};

private _armorLevel = (_armor - _levelStep) / _levelStep;

0.01 max (_armorLevel / 5) min 1
