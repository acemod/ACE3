#include "script_component.hpp"
/*
 * Author: Dextro
 * Get ammunition for BAF Vics
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Classname <STRING>
 * 2: Amount <Integer>
 * 3: Cost <Integer>
 *
 * Return Value:
 *
 * Example:
 * [_box, _class, _amount, _cost] call ace_fortify_fnc_addAmmo
 *
 * Public: Yes
 *
 */


params ["_unit","_box","_class",["_amount", 6],["_cost", 25]];

// Check Resources
_supply = [_box] call ace_rearm_fnc_getSupplyCount;

// Exit if not enough resources
if (_supplies < _cost) exitWith {["Not enough Resources", 1.5] call ace_common_fnc_displayTextStructured;};

// Progress Bar and Animation
_unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

[5, _this, {
	_args = _this select 0;
    _args params ["_unit","_box","_class","_amount","_cost"];

	// Update Supplies
	_currentSupplies = [_box] call ace_rearm_fnc_getSupplyCount;
	_suppliesLeft = (floor (_currentSupplies - _cost));
	[_box, _suppliesLeft] call ace_rearm_fnc_setSupplyCount;

	// Add Ammo
	_box addMagazineCargoGlobal [_class, _amount];
	_box addBackpackCargoGlobal ["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D", 1];

	// Status Msg
	private _str = format ["%1 Ammo Supplies left", _suppliesLeft];
	[_str, 1.5] call ace_common_fnc_displayTextStructured;
},{hint "Action Canceled"}, "Unpacking Supplies"] call ace_common_fnc_progressBar;


