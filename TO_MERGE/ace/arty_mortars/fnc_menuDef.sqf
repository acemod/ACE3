//#define DEBUG_MODE_FULL

#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

private ["_menuDef", "_menuName", "_menuRsc", "_menus"];
private ["_requiredComponent","_component","_componentlist"];

PARAMS_2(_target,_params);

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

#define __ASSEMBLE format [localize "STR_ACE_DN_MINESWEEPER_ASS_APOBS","120mm Tampella"]

_isComponent = (typeOf _target == "ACE_120Tampella_Barrel" || {typeOf _target == "ACE_120Tampella_Baseplate"});
_hasComponent = false;
if (_isComponent) then { // TODO: More into configs... once working
	if (typeOf _target == "ACE_120Tampella_Barrel") then {
		_requiredComponent = "ACE_120Tampella_Baseplate";
	} else {
		_requiredComponent = "ACE_120Tampella_Barrel";
	};
	_componentlist = nearestObjects [_target, [_requiredComponent], 3];
	if (count _componentlist > 0) then {
		_component = _componentlist select 0;
		_hasComponent = true;
	};
}; 

GVAR(target) = _target;
GVAR(components) = if (typeOf _target == "ACE_120Tampella_Barrel") then { [_target,_component] } else { [_component,_target] };


TRACE_7("",_isComponent,_hasComponent,_requiredComponent,_componentlist,_component,GVAR(target),GVAR(components));

_menus =
[
	[
		["main", _menuName, _menuRsc],
		[
			[__ASSEMBLE,
				{ GVAR(components) spawn FUNC(assemble) },
				"", "", "", -1, 1,
				_isComponent && {_hasComponent} && {ACE_SELFINTERACTION_RESTRICTED}]
		]
	]
];

//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef // return value
