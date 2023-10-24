#include "..\script_component.hpp"
/*
 * Author: Pterolatypus, LinkIsGrim
 * Returns the regular and scaled armor values the given item provides to a particular hitpoint, either from a cache or by reading the item config.
 *
 * Arguments:
 * 0: Item Class <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Regular and scaled item armor for the given hitpoint <ARRAY of NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmor
 *
 * Public: No
 */

params ["_item", "_hitpoint"];

private _key = format ["%1$%2", _item, _hitpoint];
private _return = GVAR(armorCache) get _key;

if (isNil "_return") then {
    private _armor = 0;
    private _armorScaled = 0;
    private _passThrough = 1;
    TRACE_2("Cache miss",_item,_hitpoint);
    if ("" in [_item, _hitpoint]) exitWith {
        _return = [_armor, _armorScaled];
        GVAR(armorCache) set [_key, _return];
    };

    private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";
    private _itemType = getNumber (_itemInfo >> "type");
    private _passThroughEffect = [1, 0.6] select (_itemType == TYPE_VEST);

    if (_itemType == TYPE_UNIFORM) then {
        private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
        if (_hitpoint == "#structural") then {
            // TODO: I'm not sure if this should be multiplied by the base armor value or not
            _armor = getNumber (_unitCfg >> "armorStructural");
        } else {
            private _entry = _unitCfg >> "HitPoints" >> _hitpoint;
            _armor = getNumber (_unitCfg >> "armor") * (1 max getNumber (_entry >> "armor"));
            _passThrough = 0.1 max getNumber (_entry >> "passThrough") min 1; // prevent dividing by 0
        };
    } else {
        private _condition = format ["getText (_x >> 'hitpointName') == '%1'", _hitpoint];
        private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", _condition] param [0, configNull];
        if (!isNull _entry) then {
            _armor = getNumber (_entry >> "armor");
            _passThrough = 0.1 max getNumber (_entry >> "passThrough") min 1;
        };
    };

    // Scale armor using passthrough to fix explosive-resistant armor (#9063)
    // Skip scaling for uniforms and items that don't cover the hitpoint to prevent infinite armor
    if (_armor > 0) then {
        if (_itemType == TYPE_UNIFORM) then {
            _armorScaled = _armor;
        } else {
            _armorScaled = (log (_armor / (_passThrough ^ _passThroughEffect))) * 10;
        };
    };
    _return = [_armor, _armorScaled];
    GVAR(armorCache) set [_key, _return];
};

_return // return
