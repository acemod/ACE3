#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Checks a unit's equipment to calculate the total armour on a hitpoint
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 * 2: Disable Caching <BOOLEAN> (Default: false)
 *
 * Return Value:
 * Total armour for the given hitpoint <ARRAY>
 * 0: Armour <NUMBER>
 * 1: ExplosionShielding <NUMBER>
 *
 * Example:
 * [player, "HitChest"] call ace_medical_engine_fnc_getHitpointArmour
 *
 * Public: No
 */

params ["_unit","_hitpoint",["_noCache",false]];

// Structural damage is inferred differently, not needed here
if (_hitpoint in ["", "#structural"]) exitwith {[1,1]};


// Get base values from the unit class
private _unitCfg = configFile >> "CfgVehicles" >> (typeOf _unit);
private _armour = if (isNumber (_unitCfg >> "armor")) then {getNumber (_unitCfg >> "armor")} else {2};
private _explosion = if (isNumber (_unitCfg >> "explosionShielding")) then {getNumber (_unitCfg >> "explosionShielding")} else {0.4};

// If the uniform is valid, use hitpoint values from the unit class it defines
private _uniform = uniform _unit;
if !(_uniform isEqualTo "") then {
    private _cfg = configFile >> "CfgWeapons" >> _uniform >> "ItemInfo";
    if (!isText (_cfg >> "uniformClass")) exitwith {};

    // Check for previously cached values
    private _uniformClass = getText (_cfg >> "uniformClass");
    private _cached = if (_noCache) then {[]} else {GVAR(armourCache_uniforms) getVariable [_uniformClass, []]};
    if (_cached isEqualTo []) then {
        TRACE_2("Uniform armour cache miss",_uniformClass,_noCache);
        // Scan config for uniform 'unit' hitpoints
        private _hpConfig = configFile >> "CfgVehicles" >> _uniformClass >> "HitPoints";
        _cached = [];
        {
            private _hpArmour = getNumber (_x >> "armor");
            private _hpExpl = getNumber (_x >> "explosionShielding");
            _cached pushBack [configName _x, [_hpArmour, _hpExpl]];
        } foreach ("true" configClasses _hpConfig);
        if (!_noCache) then {
            GVAR(armourCache_uniforms) setVariable [_uniformClass, _cached];
        };
    };

    // Apply the value for the correct hitpoint
    private _index = _cached findIf {_x#0 isEqualTo _hitpoint};
    if (_index > -1) then {
        _armour = _armour * _cached#1#0;
        _explosion = _explosion * _cached#1#1;
    }
};

// Add values from equipped vests and other gear
{
    private _values = [_x, _hitpoint, _noCache] call FUNC(getItemArmour);
    _armour = _armour + _values#0;
    _explosion = _explosion + _values#1;
} foreach ([vest _unit, headgear _unit] select {!(_x isEqualTo "")});

// Return
[_armour, _explosion]
