#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Hides backpack hose and reattaches respirator filter if there is one
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_respiratorDisconnect
 *
 * Public: yes
 */
 
private _unit = ACE_player;

if (!local _unit) exitWith {};

private _goggles		= goggles _unit;
private _backpack		= backpackContainer _unit;
private _backpackType	= backpack _unit;

// remove hoses
switch _backpackType do {
	case "B_CombinationUnitRespirator_01_F": {
		_backpack setObjectTextureGlobal [1, ""];
		_backpack setObjectTextureGlobal [2, ""];
		_backpack setObjectTextureGlobal [3, ""];
	};
	case "B_SCBA_01_F": {
		_backpack setObjectTextureGlobal [1, ""];
		_backpack setObjectTextureGlobal [2, ""];
	};
};

// add filters back
switch true do {
	case (_goggles in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]): {
		_unit linkItem "G_AirPurifyingRespirator_01_F";
	};
	case (_goggles in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_black_nofilter_F"]): {
		_unit linkItem "G_AirPurifyingRespirator_02_black_F";
	};
	case (_goggles in ["G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_olive_nofilter_F"]): {
		_unit linkItem "G_AirPurifyingRespirator_02_olive_F";
	};
	case (_goggles in ["G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_02_sand_nofilter_F"]): {
		_unit linkItem "G_AirPurifyingRespirator_02_sand_F";
	};
	default {};
};
