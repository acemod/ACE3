private _unit = ACE_player;

if (!local _unit) exitWith {false};

private _mode = _this;

private _goggles		= goggles _unit;
private _backpack		= backpackContainer _unit;
private _backpackType	= backpack _unit;
private _objectTextures = getObjectTextures _backpack;
private _showAction		= false;

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
private _allowedBackpacks =	[
								"B_CombinationUnitRespirator_01_F",
								"B_SCBA_01_F"
							];

if (isNull _backpack || {!(_backpackType in _allowedBackpacks)}) then {_objectTextures = ["","","","",""]};

switch _mode do {
	case "combo": {
		if !(_goggles in _allowedGoggles) exitWith {};
		if !(_backpackType in _allowedBackpacks) exitWith {};
		if (_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	case "mask": {
		if !(_goggles in (_allowedGoggles - ["G_RegulatorMask_F"])) exitWith {};
		if (_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	case "hose": {
		if !(_backpackType in _allowedBackpacks) exitWith {};
		if !(_objectTextures#1 isNotEqualTo "" || _objectTextures#2 isNotEqualTo "") exitWith {};
		_showAction = true;
	};
	default {_showAction = false};
};
_showAction;
