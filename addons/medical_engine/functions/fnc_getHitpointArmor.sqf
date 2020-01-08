#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Checks a unit's equipment to calculate the total armor on a hitpoint
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 * 2: Disable Caching <BOOLEAN> (Default: false)
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

params ["_unit","_hitpoint",["_noCache",false]];

// Structural damage is inferred differently, not needed here
if (_hitpoint in ["", "#structural"]) exitwith {[1,1]};


// Get base values from the unit class
private _unitCfg = configFile >> "CfgVehicles" >> (typeOf _unit);
private _armor = getNumber (_unitCfg >> "armor");
private _explosion = getNumber (_unitCfg >> "explosionShielding");

// If the uniform is valid, use hitpoint values from the unit class it defines
private _uniform = uniform _unit;
if !(_uniform isEqualTo "") then {
    // Check for previously cached values
    private _uniformClass = getText (configFile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
    private _cached = if (_noCache) then {[]} else {GVAR(armorCache_uniforms) getVariable [_uniformClass, []]};
    if (_cached isEqualTo []) then {
        TRACE_2("Uniform armor cache miss",_uniformClass,_noCache);
        // Scan config for uniform 'unit' hitpoints
        private _hpConfig = configFile >> "CfgVehicles" >> _uniformClass >> "HitPoints";
        _cached = [];
        {
            private _hpArmor = getNumber (_x >> "armor");
            private _hpExpl = getNumber (_x >> "explosionShielding");
            _cached pushBack [configName _x, [_hpArmor, _hpExpl]];
        } forEach configProperties [_hpConfig, "isClass _x"];
        if (!_noCache) then {
            GVAR(armorCache_uniforms) setVariable [_uniformClass, _cached];
        };
    };

    // Apply the value for the correct hitpoint
    private _index = _cached findIf {(_x select 0) isEqualTo _hitpoint};
    if (_index > -1) then {
        private _values = _cached select _index;
        _armor = _armor * (_values select 1) select 0;
        _explosion = _explosion * (_values select 1) select 1;
    }
};

// Add values from equipped vests and other gear
{
    private _values = [_x, _hitpoint, _noCache] call FUNC(getItemArmor);
    _armor = _armor + (_values select 0);
    _explosion = _explosion + (_values select 1);
} forEach [vest _unit, headgear _unit];

// Return
[_armor, _explosion]
