#include "script_component.hpp"
/*
 * Author: pterolatypus
 * Scans config for the unit's items (or uses cached values) to calculate the total armour on a hitpoint
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Total armour for the given hitpoint <ARRAY>
 * 0: Armour <NUMBER>
 * 1: ExplosionShielding <NUMBER>
 *
 * Example:
 * [player, "HitChest"] call ace_medical_engine_fnc_getArmourValueHitpoint
 *
 * Public: No
 */

 params ["_unit","_hitpoint"];

// Structural damage is inferred differently, not needed here
if (_hitpoint in ["", "#structural"]) exitwith {[1,1]};


private _unitClass = typeOf _unit;
// If the uniform is valid, we use the unit class it defines
private _uniform = uniform _unit;
if !(_uniform isEqualTo "") then {
	private _cfg = configFile >> "CfgWeapons" >> _uniform >> "ItemInfo";
	_unitClass = getText (_cfg >> "uniformClass");
};

// Get base values from the uniform or unit class
private _unitCfg = configFile >> "CfgVehicles" >> _unitClass;
private _armour = getNumber (_unitCfg >> "armor");
private _explosion = getNumber (_unitCfg >> "explosionShielding");

private _hpClass = _unitCfg >> "HitPoints" >> _hitpoint;
if (isNumber (_hpClass >> "armor")) then {_armour =  _armour * getNumber (_hpClass>>"armor")};
if (isNumber (_hpClass >> "explosionShielding")) then {_explosion = _explosion * getNumber (_hpClass>>"explosionShielding")};


// Add values from equipped vests and other gear
{
	private _values = [_x, _hitpoint] call FUNC(getItemArmour);
	_armour = _armour + _values#0;
	_explosion = _explosion + _values#1;
} foreach [vest _unit, headgear _unit];

// Return
[_armour, _explosion]