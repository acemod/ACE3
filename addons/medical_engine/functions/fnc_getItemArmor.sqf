#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Scans config or uses cached values to determine what armor a particular item provides to a particular hitpoint
 *
 * Arguments:
 * 0: Item Classname <STRING>
 * 1: Hitpoint <STRING>
 * 2: Disable Caching <BOOLEAN> (Default: false)
 *
 * Return Value:
 * Protection the item applies to that hitpoint <ARRAY>
 * 0: Armor <NUMBER>
 * 1: ExplosionShielding <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmor
 *
 * Public: No
 */

 params ["_item","_hitpoint",["_noCache",false]];

_hitpoint = toLower _hitpoint;

if (_item isEqualTo "") exitwith {[0,0]};

// Return the cached value if found
private _cached = if (_noCache) then {[]} else {GVAR(armorCache_items) getVariable [_item,[]]};
if !(_cached isEqualTo []) exitwith {
    private _index = _cached findIf {(_x select 0) isEqualTo _hitpoint};
    if (_index == -1) then {[0,0]} else {(_cached select _index) select 1};
};
TRACE_1("Item armor cache miss",_item);

private _protection = configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo";
// If the item has no protection, cache as empty
if (!isClass _protection) exitwith {
    GVAR(armorCache_items) setVariable [_item,[]];
    [0,0] //return default
};

// Read all armor values from config
// TODO: if a hitpoint has multiple entries this will find them all, but only the first will be returned by findIf. Do I need to do something (add them together?) or is this fine?
private _armorValues = [];
{
    private _protectionHitpoint = toLower getText (_x >> "hitpointName");
    private _armor = getNumber (_x >> "armor");
    private _explosion = getNumber (_x >> "explosionShielding");
    _armorValues pushBack [_protectionHitpoint, [_armor, _explosion]];
} forEach configProperties [_protection, "isClass _x"];

if (!_noCache) then {
    GVAR(armorCache_items) setVariable [_item, _armorValues];
};

// Return the value that was actually requested
private _index = _armorValues findIf {(_x select 0) isEqualTo _hitpoint};
if (_index == -1) then {[0,0]} else {(_armorValues select _index) select 1} //return
