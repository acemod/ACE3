#include "..\script_component.hpp"
/*
 * Author: Pterolatypus, LinkIsGrim
 * Returns the armor value provided by an item to a hitpoint. Armor may be scaled back if over the cap.
 *
 * Arguments:
 * 0: Item Class <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Item armor for the given hitpoint, may be scaled. <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemArmor
 *
 * Public: No
 */

params ["_item", "_hitpoint"];

GVAR(armorCache) getOrDefaultCall [_this joinString "$", {
    TRACE_2("Cache miss",_item,_hitpoint);
    private _armor = 0;
    private _passThrough = 1;

    if !("" in [_item, _hitpoint]) then {
        private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";
        private _itemType = getNumber (_itemInfo >> "type");

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
            private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", "getText (_x >> 'hitpointName') == _hitpoint"] param [0, configNull];
            if (!isNull _entry) then {
                _armor = getNumber (_entry >> "armor");
                _passThrough = 0.1 max getNumber (_entry >> "passThrough") min 1;
            };
        };

        // Scale armor using passthrough to fix explosive-resistant & stupid armor (#9063)
        // Skip scaling for uniforms and items that don't cover the hitpoint to prevent infinite armor
        private _armorLevelStep = [4, 2] select (_itemType == TYPE_HEADGEAR);
        if (_itemType != TYPE_UNIFORM && (_armor > _armorLevelStep * 6)) then {
            private _passThroughEffect = [1, 0.6] select (_itemType == TYPE_VEST);
            _armor = (log (_armor / (_passThrough ^ _passThroughEffect))) * 10;
        };
    };

    _armor // return
}, true]
