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

// Helper function to check items with HitpointsProtectionInfo
private _fnc_getItemArmor = {
    params ["_item", "_hitpoint"];
    if (_item isEqualTo "") exitWith {[0,0]};
    private _key = format ["%1$%2", _item, _hitpoint];
    private _armorValues = GVAR(armorCache) getVariable _key;
    if (isNil "_armorValues") then {
        TRACE_2("Cache miss", _item, _hitpoint);
        private _cfg = configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo";
        private _condition = format ["getText (_x >> ""hitpointName"") == ""%1""",_hitpoint];
        private _entry = configProperties [_cfg, _condition] param [0, configNull];
        _armorValues = [getNumber (_entry >> "armor"), getNumber (_entry >> "explosionShielding")];
        GVAR(armorCache) setVariable [_key, _armorValues];
    };
    _armorValues // return
};

private _uniform = uniform _unit;
// If unit is naked, use its underwear class instead
if (_uniform isEqualTo "") then {
    _uniform =  getText (configFile >> "CfgVehicles" >> typeOf _unit >> "nakedUniform");
};

// Uniform base values are a multiplier for all hitpoint values
private _baseValues = GVAR(armorCache) getVariable (_uniform + "$armor");
if (isNil "_baseValues") then {
    TRACE_1("Cache miss", _uniform);
    private _uniformClass = getText (configFile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
    private _unitCfg = configFile >> "CfgVehicles" >> _uniformClass;
    _baseValues = [getNumber (_unitCfg >> "armor"), getNumber (_unitCfg >> "explosionShielding")];
    GVAR(armorCache) setVariable [(_uniform + "$armor"), _baseValues];
};
_baseValues params ["_armor", "_explosion"];

// Get values for the specific hitpoint
private _key = format ["%1$%2", _uniform, _hitpoint];
private _hitpointValues = GVAR(armorCache) getVariable _key;
if (isNil "_armorValues") then {
    TRACE_2("Cache miss", _uniform, _hitpoint);
    private _uniformClass = getText (configFile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
    private _hitpointCfg = configFile >> "CfgVehicles" >> _uniformClass >> "HitPoints" >> _hitpoint;
    _hitpointValues = [getNumber (_hitpointCfg >> "armor"), getNumber (_hitpointCfg >> "explosionShielding")];
    GVAR(armorCache) setVariable [_key, _hitpointValues];
};

_armor = _armor * (_hitpointValues select 0);
_explosion = _explosion * (_hitpointValues select 1);

// Add values from relevant gear
{
    [_x, _hitpoint] call _fnc_getItemArmor params ["_armorX", "_explosionX"];
    _armor = _armor + _armorX;
    _explosion = _explosion + _explosionX;
} forEach [vest _unit, headgear _unit];

// Return
[_armor, _explosion];
