#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Checks if respirator interactions should be shown based on equipment combinations
 *
 * Arguments:
 * 0: mode <STRING>
 *
 * Return Value:
 * Should interaction be shown? <BOOL>
 *
 * Example:
 * ["combo"] call ace_goggles_fnc_respiratorConditions
 *
 * Public: yes
 */
 
private _unit = ACE_player;

if (!local _unit) exitWith {false};

params ["_mode"];

private _goggles		= goggles _unit;
private _backpack		= backpackContainer _unit;
private _backpackType	= backpack _unit;
private _objectTextures = getObjectTextures _backpack;
private _showAction		= false;

// Contact DLC respirators
private _allowedGoggles	= 	[	
								"G_AirPurifyingRespirator_01_F",
								"G_AirPurifyingRespirator_01_nofilter_F",
								"G_AirPurifyingRespirator_02_black_F",
								"G_AirPurifyingRespirator_02_black_nofilter_F",
								"G_AirPurifyingRespirator_02_olive_F",
								"G_AirPurifyingRespirator_02_olive_nofilter_F",
								"G_AirPurifyingRespirator_02_sand_F",
								"G_AirPurifyingRespirator_02_sand_nofilter_F",
								"G_RegulatorMask_F"
							];
// Contact DLC respirator backpacks
private _allowedBackpacks =	[
								"B_CombinationUnitRespirator_01_F",
								"B_SCBA_01_F"
							];

if (isNull _backpack || {!(_backpackType in _allowedBackpacks)}) then {_objectTextures = ["","","","",""]};

switch _mode do {
	// only show when appropriate respirator and backpack are worn
	case "combo": {
		if !(_goggles in _allowedGoggles) exitWith {};
		if !(_backpackType in _allowedBackpacks) exitWith {};
		if (_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	// always show when wearing mask with filters
	case "mask": {
		if !(_goggles in (_allowedGoggles - ["G_RegulatorMask_F"])) exitWith {};
		if (_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	// shown only when hose is present regardless of respirator (Arma does not dynamically remove the hose)
	case "hose": {
		if !(_backpackType in _allowedBackpacks) exitWith {};
		if !(_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	default {};
};
_showAction;
