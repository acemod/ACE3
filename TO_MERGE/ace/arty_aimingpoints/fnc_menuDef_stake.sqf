//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

TRACE_1("enter", _this);

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus", "_goodStake", "_obj", "_objList"];
PARAMS_2(_target,_params);

_menuDef = [];
_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------

if (GVAR(placingStake)) exitWith {
	TRACE_1("EXITINGGGG", GVAR(placingStake));
	_menuDef
};

_goodStake = false;
_isCollimator = false;
_isAimingCircle = false;
GVAR(pickupStakeObject) = nil;
_obj = nil;
if(_target isKindOf "ACE_Arty_AimingStakes" || {_target isKindOf "ACE_Arty_M2A2_Aiming_Circle"}) then {
	_obj = _target;
	_goodStake = true;
	if (typeOf _obj == "ACE_Arty_M1A1_Collimator") then {
		_isCollimator = true;
	};
	if(typeOf _obj == "ACE_Arty_M2A2_Aiming_Circle") then {
		_isAimingCircle = true;
	};
} else {
	_objList = (getPos player) nearObjects["ACE_Arty_AimingStakes", 1.5];


	if (count _objList > 0) then {
		{
			private["_stake", "_rPos"];
			_stake = _x;
			
			_rPos = player worldToModel (getPos _stake);
			TRACE_2("checking", _stake, _rPos);
			if (_rPos select 1 > 0) exitWith {
				TRACE_1("done!", _stake);
				_obj = _stake;
				_goodStake = true;
				if (typeOf _stake == "ACE_Arty_M1A1_Collimator") then {
					_isCollimator = true;
				};
			};
		} forEach _objList;
	};
};

if (!_goodStake) exitWith {
	TRACE_1("EXITINGGGG BAD STAKE", _menuDef,GVAR(placingStake));
	_menuDef 
};

GVAR(pickupStakeObject) = _obj;
TRACE_1("doing menu");
_menus = 
[
	[
		["main", "", _menuRsc],
		[
			[localize "STR_ACE_ARTY_ALLIGN_COLLIMATOR",
				{ [GVAR(pickupStakeObject)] call FUNC(onAlignCollimator) },
				"", "", "", -1,
				1, (_goodStake && {_isCollimator})],
			// Moved to sys_cargo\fnc_carry!	
			[localize "STR_ACE_ARTY_PICKUP_STAKE",
				{ [GVAR(pickupStakeObject)] call FUNC(onPickupStake) },
				"", "", "", -1,
				1, (_goodStake)],
			[localize "STR_ACE_ARTY_RAISE_STAKE",
				{ [GVAR(pickupStakeObject), 0.25] call FUNC(onModifyStake) },
				"", "", "", -1,
				1, (_goodStake && {!_isCollimator} && {!_isAimingCircle})],
			[localize "STR_ACE_ARTY_LOWER_STAKE",
				{ [GVAR(pickupStakeObject), -0.25] call FUNC(onModifyStake) },
				"", "", "", -1,
				1, (_goodStake && {!_isCollimator} && {!_isAimingCircle})]
		]
	]
];
//-----------------------------------------------------------------------------

{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

TRACE_1("",_menuDef);
if(isNil "_menuDef") then {_menuDef = [] };
_menuDef // return value
