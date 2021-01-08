#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Checks a unit's equipment to calculate the total armor on a hitpoint.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Array of hitpoint armor <ARRAY>
 *
 * Example:
 * [player] call ace_medical_damage_fnc_getArmor
 *
 * Public: No
 */

params ["_unit"];

private _uniform = uniform _unit;
// If unit is naked, use its underwear class instead
if (_uniform isEqualTo "") then {
	_uniform = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "nakedUniform");
};

private _gear = [
    _uniform,
    vest _unit,
    headgear _unit
];

private _rags = _gear joinString "$";
private _var = format [QGVAR(armorCache%1), _rags];
(localNamespace getVariable [_var, [""]]) params ["_prevRags", "_armor"];

if (_rags != _prevRags) then {
	_armor = [];
	private _hitpoints = _unit getVariable QEGVAR(medical,HitPoints);

	private _itemInfo = configFile >> "CfgWeapons" >> _uniform >> "ItemInfo";
	private _unitCfg = configFile >> "CfgVehicles" >> getText (_itemInfo >> "uniformClass");
	private _unitArmor = getNumber (_unitCfg >> "armor");

	// Get armor from unit class
	{
		_armor set [_forEachIndex, _unitArmor * getNumber (_unitCfg >> "HitPoints" >> _x >> "armor")];
	} forEach _hitpoints;


	// Get armor from vest and helmet
    {
		private _entries = configProperties [configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo"];
		{
			private _hp = toLower getText (_x >> "hitpointName");
			private _idx = _hitpoints find _hp;
			_armor set [_idx, (_armor select _idx) + getNumber (_x >> "armor")];
		} forEach _entries;
    } forEach (_gear select [1,2]);


	// Set vanilla limb hitpoint armor to ace limb hitpoint armor
	private _hitarms = _armor select (_hitpoints find "hitarms");
	private _hitlegs = _armor select (_hitpoints find "hitlegs");

	_armor set [_hitpoints find "hitleftarm", _hitarms]; 
	_armor set [_hitpoints find "hitrightarm", _hitarms]; 
	_armor set [_hitpoints find "hitleftleg", _hitlegs]; 
	_armor set [_hitpoints find "hitrightleg", _hitlegs]; 

    localNamespace setVariable [_var, [_rags, _armor]];
};

_armor // return