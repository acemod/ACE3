#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns the armor plate level and passThrough an item provides to a hitpoint.
 *
 * Arguments:
 * 0: Item Class <STRING>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * 0: Plate level, 0 (uncovered) to 5 <NUMBER>
 * 1: Fraction of damage passed through to the wearer <NUMBER>
 *
 * Example:
 * ["V_PlateCarrier_rgr", "HitChest"] call ace_medical_engine_fnc_getItemPlate
 *
 * Public: No
 */

params ["_item", "_hitpoint"];

GVAR(plateCache) getOrDefaultCall [_this joinString "$", {
    TRACE_2("Cache miss",_item,_hitpoint);
    private _level = 0;
    private _passThrough = 1;

    if !("" in [_item, _hitpoint]) then {
        private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";
        private _itemType = getNumber (_itemInfo >> "type");

        private _armor = -1;

        if (_itemType == TYPE_UNIFORM) then {
            // Uniform armor lives on the CfgVehicles class it spawns, and its hitpoint armor is a
            // coefficient of the unit's base armor rather than an absolute value like a vest's.
            // Multiplied out it lands on the same ladder - CSAT fatigues are II, Viper suits III
            private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
            private _entry = _unitCfg >> "HitPoints" >> _hitpoint;

            if (isClass _entry) then {
                _armor = getNumber (_unitCfg >> "armor") * (1 max getNumber (_entry >> "armor"));
                _passThrough = 0 max getNumber (_entry >> "passThrough") min 1;
            };
        } else {
            private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", "getText (_x >> 'hitpointName') == _hitpoint"] param [0, configNull];

            if (!isNull _entry) then {
                _armor = getNumber (_entry >> "armor");
                _passThrough = 0 max getNumber (_entry >> "passThrough") min 1;
            };
        };

        if (_armor >= 0) then {
            private _isHeadgear = _itemType == TYPE_HEADGEAR;
            private _maxLevel = [MAX_PLATE_LEVEL, MAX_HELMET_LEVEL] select _isHeadgear;
            private _step = [ARMOR_LEVEL_STEP_VEST, ARMOR_LEVEL_STEP_HEADGEAR] select _isHeadgear;

            // Values above the top of the ladder aren't "better than level V", they're bad data - clamp instead of scaling
            _level = 0 max (_armor/_step - 1) min _maxLevel;

            // Every vanilla helmet is passThrough 0.5, so it carries no level information for headgear
            if (!_isHeadgear) then {
                private _levelFromPassThrough = 0 max ((ARMOR_LEVEL_PASSTHROUGH_BASE - _passThrough) / ARMOR_LEVEL_PASSTHROUGH_STEP) min _maxLevel;
                _level = _level * ARMOR_LEVEL_ARMOR_WEIGHT + _levelFromPassThrough * (1 - ARMOR_LEVEL_ARMOR_WEIGHT);
            };
        };
    };

    TRACE_4("gotPlate",_item,_hitpoint,_level,_passThrough);
    [_level, _passThrough] // return
}, true]
