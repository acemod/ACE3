#include "script_component.hpp"
/*
 * Author: Dextro
 * Claims Resources from Box
 *
 * Arguments:
 * 0: Box <OBJECT>
 *
 * Return Value:
 *
 * Example:
 * [_target] call ace_fortify_fnc_claimResources
 *
 * Public: Yes
 */


params ["_box","_unit"];

// Progress Bar and Animation
_unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
[8, _box, {
	private _box = _this select 0;
	ace_trenches_trenchSupplies = ace_trenches_trenchSupplies + ace_fortify_fortificationSupplyGain;
	publicVariable "ace_trenches_trenchSupplies";
	deleteVehicle _box;
},{hint "Action Canceled"}, "Taking Supplies"] call ace_common_fnc_progressBar;


