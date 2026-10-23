#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Statement to sort items by their armor level.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER>
 *
 * Public: No
*/

params ["_config"];

// Same classification the armor penetration model and the armor stat use
private _itemType = getNumber (_config >> "ItemInfo" >> "type");
private _hitpoint = ["HitChest", "HitHead"] select (_itemType == TYPE_HEADGEAR);

([configName _config, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_armorLevel"];

_armorLevel
