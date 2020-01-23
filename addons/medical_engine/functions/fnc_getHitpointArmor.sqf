#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Checks a unit's equipment to calculate the total armor on a hitpoint
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Total armor for the given hitpoint <ARRAY>
 * 0: Armor <NUMBER>
 * 1: ExplosionShielding <NUMBER>
 *
 * Example:
 * [player, "HitChest"] call ace_medical_engine_fnc_getHitpointArmor
 *
 * Public: No
 */
params ["_unit", "_hitpoint"];

// Helper function to check cache and/or read config
private _fnc_getItemArmor = {
    params ["_item", "_hitpoint"];

    private _key = format ["%1$%2", _item, _hitpoint];
    private _armor = GVAR(armorCache) getVariable _key;

    if (isNil "_armor") then {

        TRACE_2("Cache miss", _item, _hitpoint);
        if (_item isEqualTo "" || _hitpoint isEqualTo "") exitWith {
            _armor = 0;
            GVAR(armorCache) setVariable [_key, _armor];
        };

        private _itemInfo = configFile >> "CfgWeapons" >> _item >> "ItemInfo";

        if (getNumber (_itemInfo >> "type") == TYPE_UNIFORM) then {
            private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
            private _entry = _unitCfg >> "HitPoints" >> _hitpoint;

            _armor = getNumber (_unitCfg >> "armor") * getNumber (_entry >> "armor")
        } else {
            private _condition = format ["getText (_x >> 'hitpointName') == '%1'",_hitpoint];
            private _entry = configProperties [_itemInfo >> "HitpointsProtectionInfo", _condition] param [0, configNull];

            _armor = getNumber (_entry >> "armor");
        };

        GVAR(armorCache) setVariable [_key, _armor];
    };

    _armor // return
};

private _uniform = uniform _unit;
// If unit is naked, use its underwear class instead
if (_uniform isEqualTo "") then {
    _uniform =  getText (configFile >> "CfgVehicles" >> typeOf _unit >> "nakedUniform");
};

private _armor = 0;
// Add values from relevant gear
{
    _armor = _armor + ([_x, _hitpoint] call _fnc_getItemArmor);
} forEach [_uniform, vest _unit, headgear _unit];

_armor // return
