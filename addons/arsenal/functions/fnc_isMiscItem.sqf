#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Determines if a class is a miscellaneous item or not.
 *
 * Arguments:
 * 0: Item, or magazine <STRING>
 *
 * Return Value:
 * True if class is a misc item, otherwise false <BOOL>
 *
 * Example:
 * "ACE_CableTie" call ace_arsenal_fnc_isMiscItem;
 *
 * Public: No
*/

params ["_item"];

private _cfgWeapons = configFile >> "CfgWeapons";
private _config = _item call CBA_fnc_getItemConfig;
_item isKindOf ["CBA_MiscItem", _cfgWeapons] ||
{getNumber (_config >> "ACE_asItem") == 1} ||
{getNumber (_config >> "ACE_isUnique") == 1};
