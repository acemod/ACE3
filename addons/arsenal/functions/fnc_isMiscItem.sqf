#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Determines if a class is a miscellaneous item or not.
 *
 * Arguments:
 * 0: Item or magazine <STRING>
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

_item isKindOf ["CBA_MiscItem", configFile >> "CfgWeapons"] || {
    private _config = _item call CBA_fnc_getItemConfig;
    getNumber (_config >> "ACE_asItem") == 1 || {getNumber (_config >> "ACE_isUnique") == 1}
};
