//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

TRACE_1("enter", _this);

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus", "_playerHasStake", "_wepArray"];
private [];
// _this==[_target, _menuNameOrParams]
_target = _this select 0;
_params = _this select 1;

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

if (GVAR(placingStake)) exitWith { _menuDef };

_playerHasStake = false;
GVAR(selfInteractStake) = nil;
{
	private["_wep"];
	_wep = _x;
	if ([_wep, "ACE_BaseAimingPost", "CfgWeapons"] call FUNC(isKindOf)) exitWith {
		GVAR(selfInteractStake) = _wep;
		_playerHasStake = true;
	};
} forEach (weapons player);

_playerInVehicle = (vehicle player != player);

_menus = 
[
	[
		["main", localize "STR_ACE_MENU_EQUIPPLAYER", _menuRsc],
		[
			[localize "STR_ACE_ARTY_PLACE_STAKE",
				{ [GVAR(selfInteractStake)] call FUNC(onPlaceStake) },
				"", "", "", -1,
				1, !_playerInVehicle && {_playerHasStake}]
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

_menuDef // return value
