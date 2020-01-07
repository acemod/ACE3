#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Scans config or uses cached values to determine what armour a particular item provides to a particular hitpoint
 *
 * Arguments:
 * 0: Item Classname <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Protection the item applies to that hitpoint <ARRAY>
 * 0: Armour <NUMBER>
 * 1: ExplosionShielding <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmour
 *
 * Public: No
 */

 params ["_item","_hitpoint"];

_hitpoint = toLower _hitpoint;

// Return the cached value if found
private _cached = GVAR(armourCache_items) getVariable _item;
if (!isNil "_cached") exitwith {
    private _index = _cached findIf {_x#0 isEqualTo _hitpoint};
    if (_index == -1) then {[0,0]} else {(_cached select _index)#1};
};
TRACE_1("Item armour cache miss",_item);

private _protection = configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo";
// If the item has no protection, cache as empty
if (!isClass _protection) exitwith {
    GVAR(armourCache_items) setVariable [_item,[]];
    [0,0] //return default
};

// Read all armour values from config
// TODO: do I need to worry about inheritance here?
// TODO: if a hitpoint has multiple entries this will find them all, but only the first will be returned by findIf. Do I need to do something (add them together?) or is this fine?
private _armourValues = [];
{
    private _protectionHitpoint = toLower getText (_x >> "hitpointName");
    private _armour = if (isNumber (_x >> "armor")) then {getNumber (_x >> "armor")} else {0};
    private _expl = if (isNumber (_x >> "explosionShielding")) then {getNumber (_x >> "explosionShielding")} else {0};
    _armourValues pushBack [_protectionHitpoint,[_armour,_expl]];
} foreach ("isText (_x >> ""hitpointName"")" configClasses _protection);

GVAR(armourCache_items) setVariable [_item, _armourValues];

// Return the value that was actually requested
private _index = _armourValues findIf {_x#0 isEqualTo _hitpoint};
if (_index == -1) then {[0,0]} else {(_armourValues select _index)#1} //return
