/*
 * Author: commy2
 *
 * What kind of item is given classname
 *
 * Argument:
 * 0: Classname of a item. (String)
 *
 * Return value:
 * Item type. (Array)
 * 0: "weapon", "item", "magazine", "unknown" or "" (String)
 * 1: A description of the item (e.g. "primary" for a weapon or "vest" for a vest item)
 *
 */
#include "script_component.hpp"

private "_item";

_item = _this select 0;

_cfgType = [_item] call FUNC(getConfigType);

if (_cfgType == "CfgGlasses") exitWith {["item","glasses"]};

if (_cfgType == "CfgMagazines") exitWith { ["magazine", [_item] call FUNC(getItemTypeWeapon) select 1] };

if (_cfgType == "CfgWeapons") exitWith { [_item] call FUNC(getItemTypeWeapon) };

["",""]
