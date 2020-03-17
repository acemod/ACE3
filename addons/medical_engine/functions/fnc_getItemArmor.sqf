#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Returns the armor value the given item provides to a particular hitpoint, either from a cache or by reading the item config.
 *
 * Arguments:
 * 0: Item Class <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Item armor for the given hitpoint <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmor
 *
 * Public: No
 */

params ["_item", "_hitpoint"];

private _key = format ["%1$%2", _item, _hitpoint];
private _armor = GVAR(armorCache) getVariable _key;

if (isNil "_armor") then {
    TRACE_2("Cache miss",_item,_hitpoint);
    if ("" in [_item, _hitpoint]) exitWith {
        _armor = 0;
        GVAR(armorCache) setVariable [_key, _armor];
    };

    private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";

    if (getNumber (_itemInfo >> "type") == TYPE_UNIFORM) then {
        private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
        private _entry = _unitCfg >> "HitPoints" >> _hitpoint;

        _armor = getNumber (_unitCfg >> "armor") * getNumber (_entry >> "armor")
    } else {
        private _condition = format ["getText (_x >> 'hitpointName') == '%1'", _hitpoint];
        private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", _condition] param [0, configNull];

        _armor = getNumber (_entry >> "armor");
    };

    GVAR(armorCache) setVariable [_key, _armor];
};

_armor // return
