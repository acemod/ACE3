#include "script_component.hpp"
/*
 * Author: Pterolatypus, Salluci
 * Returns the scaled armor value the given item provides to a particular hitpoint, either from a cache or by reading the item config.
 *
 * Arguments:
 * 0: Item Class <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Scaled item armor for the given hitpoint <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmor
 *
 * Public: No
 */

params ["_item", "_hitpoint"];

private _key = format ["%1$%2", _item, _hitpoint];
private _armor = GVAR(armorCache) get _key;

if (isNil "_armor") then {
    _armor = 0;
    private _passThrough = 1;
    TRACE_2("Cache miss",_item,_hitpoint);
    if ("" in [_item, _hitpoint]) exitWith {
        GVAR(armorCache) set [_key, _armor];
    };

    private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";

    if (getNumber (_itemInfo >> "type") == TYPE_UNIFORM) then {
        private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
        if (_hitpoint == "#structural") then {
            // TODO: I'm not sure if this should be multiplied by the base armor value or not
            _armor = getNumber (_unitCfg >> "armorStructural");
        } else {
            private _entry = _unitCfg >> "HitPoints" >> _hitpoint;
            _armor = getNumber (_unitCfg >> "armor") * (1 max getNumber (_entry >> "armor"));
            _passThrough = (0.01 max getNumber (_entry >> "passThrough")); // prevent dividing by 0
        };
    } else {
        private _condition = format ["getText (_x >> 'hitpointName') == '%1'", _hitpoint];
        private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", _condition] param [0, configNull];
        if (!isNull _entry) then {
            _armor = getNumber (_entry >> "armor");
            _passThrough = (0.01 max getNumber (_entry >> "passThrough"));
        };
    };

    // Scale armor using passthrough to fix explosive resistant armor (#9063)
    // Skip scaling for items that don't cover the hitpoint to prevent infinite armor
    if (_armor != 0) then {
        _armor = (log (_armor / _passThrough)) * 10;
    };
    GVAR(armorCache) set [_key, _armor];
};

_armor // return
