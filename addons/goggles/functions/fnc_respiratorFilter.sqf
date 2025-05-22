#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Toggles respirator filter
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_respiratorFilter
 *
 * Public: yes
 */
 
private _unit = ACE_player;

if (!local _unit) exitWith {};

private _goggles = goggles _unit;

// toggle filters
switch _goggles do {
	case "G_AirPurifyingRespirator_01_F": {
		_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";
	};
	case "G_AirPurifyingRespirator_02_black_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_black_nofilter_F";
	};
	case "G_AirPurifyingRespirator_02_olive_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_olive_nofilter_F";
	};
	case "G_AirPurifyingRespirator_02_sand_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_sand_nofilter_F";
	};
	case "G_AirPurifyingRespirator_01_nofilter_F": {
		_unit linkItem "G_AirPurifyingRespirator_01_F";
	};
	case "G_AirPurifyingRespirator_02_black_nofilter_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_black_F";
	};
	case "G_AirPurifyingRespirator_02_olive_nofilter_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_olive_F";
	};
	case "G_AirPurifyingRespirator_02_sand_nofilter_F": {
		_unit linkItem "G_AirPurifyingRespirator_02_sand_F";
	};
	default {};
};
