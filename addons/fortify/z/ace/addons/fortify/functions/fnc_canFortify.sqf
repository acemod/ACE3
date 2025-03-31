#include "script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player can fortify.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Cost <NUMBER> (default: -1)
 * 2: Tier <NUMBER> (default: 0)
 * 3: Mod Required <STRING> (default: "")
 * 4: Mod Prohibited <STRING> (default: "")
 *
 * Return Value:
 * Can Fortify <BOOL>
 *
 * Example:
 * [player, 50, 2, false] call ace_fortify_fnc_canFortify
 *
 * Public: Yes
 */


params ["_unit", ["_cost", -1],["_tier",0],["_requireMod",""],["_prohibitedMod",""]];
private _return = false;

// Check if a specific mod is required or prohibited
if ((!(count _requireMod == 0) && !(isClass(configfile >> 'CfgPatches' >> _requireMod))) || (isClass(configfile >> 'CfgPatches' >> _prohibitedMod))) exitWith {_return};

// Check sandbags first
if (_cost < 0 && "ACE_Fortication_Material" in (items _unit)) then {
	_return = true
}; 

// Check higher tier requirements
if (_cost >= 0) then {

	// Reduce tier requirement when in construction area
	if ([_unit] call DFUNC(constructionArea)) then {
		_tier = _tier - 1;
	};

	// Assess units capability (tiers)
	if ({_x in (items _unit)} count ["ACE_ConstructionTool","ACE_EntrenchingTool"] >= _tier && _cost <= ace_trenches_trenchSupplies) then {
		_return = true;
	};
};

// Return
_return
