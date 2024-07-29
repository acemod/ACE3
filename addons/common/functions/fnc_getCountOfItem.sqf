#include "..\script_component.hpp"
/*
 * Author: Dedmen, Blue, johnb43
 * Return how many items of type _itemType the player has in his containers (Uniform, Vest, Backpack)
 * Doesn't count assignedItems, weapons, weapon attachments, magazines in weapons
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname of item (Case-Sensitive) <STRING>
 *
 * Return Value:
 * Item Count <NUMBER>
 *
 * Example:
 * [bob, "FirstAidKit"] call ace_common_fnc_getCountOfItem
 *
 * Public: Yes
 */

params ["_unit", "_itemType"];

private _count = 0;
private _isMagazine = isClass (configFile >> "CfgMagazines" >> _itemType);

{
    (if (_isMagazine) then {
        getMagazineCargo _x
    } else {
        getItemCargo _x
    }) params ["_itemTypes", "_itemCounts"];

    _count = _count + (_itemCounts param [_itemTypes find _itemType, 0]);
} forEach [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];

_count
