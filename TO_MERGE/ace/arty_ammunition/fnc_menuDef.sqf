// #define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

#define TARGET_TYPE_INVALID	-1
#define TARGET_TYPE_CRATE 	1
#define TARGET_TYPE_GUN 	2
#define TARGET_TYPE_SHELL 	3

private ["_menuDef","_menuName", "_roundData", "_menuRsc", "_menus", "_typeOfTarget", "_hasShell", "_carryShell"];

PARAMS_2(_target,_params);
TRACE_1("", _this);
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
// check to see if its either one of our vehicle shells, a cannon, or an ammobox with shells
_hasShell = false;
_typeOfTarget = TARGET_TYPE_INVALID;

if ([typeOf _target, "ReammoBox", "CfgVehicles"] call FUNC(isKindOf)) then {
	_typeOfTarget = TARGET_TYPE_CRATE;
} else {
	if ([typeOf _target, "StaticCannon", "CfgVehicles"] call FUNC(isKindOf)) then {
			_typeOfTarget = TARGET_TYPE_GUN;
	} else {
		if ([typeOf _target, "StaticMortar", "CfgVehicles"] call FUNC(isKindOf)) then {
			_typeOfTarget = TARGET_TYPE_GUN;
		} else {
			// TODO: check for a weaponholder with a shell in it here right?
			if ([typeOf _target, "ACE_Arty_ShellHolder", "CfgVehicles"] call FUNC(isKindOf)) then {
				_typeOfTarget = TARGET_TYPE_SHELL;
			};
		};
	};
};
// Bail if its an inalid target
_carryShell = player getVariable "ACE_ARTY_CARRY_SHELL";
if (!isNil "_carryShell") then {
	_hasShell = true;
};
if (!_hasShell && {_typeOfTarget == TARGET_TYPE_INVALID}) exitWith {};

GVAR(target) = _target;

private "_ali_tar";
_ali_tar = alive _target;

// fire off a hint if its a shell with variables, so they can see what kind of shell they are picking up
if (_ali_tar && {_typeOfTarget == TARGET_TYPE_SHELL}) then {
	_roundData = _target getVariable "ACE_ARTY_PREP";
	if !(isNil "_roundData") then {
		_name = getText(configFile >> "CfgMagazines" >> (_roundData select 0) >> "displayName");
		hintSilent _name;
	};
};

_loaded = false;
if (_ali_tar && {_typeOfTarget == TARGET_TYPE_GUN} && {!_hasShell}) then {
	_count = count(_target getVariable ["ace_sys_arty_currentRound", []]);
	if (_count > 0) then {
		_loaded = true;
	};
};

_hell = "hot";
_BoxShellBelongsTo = _target getVariable [QGVAR(belongsToBox),objNull];
_distance = 100;
_inRange = false;
_hasRoom = false;
_magazineToStore = "";
if (!isNull _BoxShellBelongsTo) then {
	_inRange = (_BoxShellBelongsTo distance player) < 6;
	_true_capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _BoxShellBelongsTo >> "transportMaxMagazines");
	_cur_capacity_ar = (getMagazineCargo _BoxShellBelongsTo) select 1;
	_capacity = 0;
	{
		_capacity = _capacity + _x;
	} foreach _cur_capacity_ar;
	_hasRoom = (_true_capacity - _capacity) > 0;
	_magazineToStore = getText(configFile >> "CfgVehicles" >> typeOf _target >> "ACE_ARTY_MAGAZINE_CLASS");
	GVAR(packArray) = [_target,_BoxShellBelongsTo,_magazineToStore];
};

// Automatically convert BIS magazines in the boxes IF an ACE mortar is found nearby when BOX is accessed
if (_typeOfTarget == TARGET_TYPE_CRATE) then {
	_nearACEmortar = (position _target) nearEntities [["ACE_M252","ACE_M224_1","ACE_2b14_82mm"], 30];
	if (count _nearACEmortar > 0) then {
		_magazines = (getMagazineCargo _target) select 0;
		_count = (getMagazineCargo _target) select 1;
		if (count _magazines > 0) then {
			for "_i" from 0 to (count _magazines - 1) do {
				_magazine_x = _magazines select _i;
				_count_x = _count select _i;
				_isBISArtyShell = isText(configFile >> "CfgMagazines" >> _magazine_x >> "ACE_ARTY_SHELL_MAGAZINE");
				if (_isBISArtyShell) then {
					_convert = getText(configFile >> "CfgMagazines" >> _magazine_x >> "ACE_ARTY_SHELL_MAGAZINE");
					[_target,_magazine_x, _count_x] call ACE_fnc_removemagazinecargo;
					_target addMagazineCargoGlobal [_convert,_count_x];
				};
			};
		};
	};
};

_menus = [
	[
		["main", "", _menuRsc],
		[
			[localize "STR_ACE_ARTY_AMMUNITION_PREP",
				{ [GVAR(target)] spawn FUNC(openPrepDialog) },
				"", "", "", -1,
				1, _ali_tar && {_typeOfTarget == TARGET_TYPE_CRATE}],
			[localize "STR_ACE_ARTY_AMMUNITION_STOCKPILE_BOXES",
				{ [GVAR(target)] spawn FUNC(stockpileBoxes) },
				"", "", "", -1,
				1, _ali_tar && {_typeOfTarget == TARGET_TYPE_CRATE} && {_hell == "frozen"}],
			[localize "STR_ACE_ARTY_AMMUNITION_LOAD_GUN",
				{ [GVAR(target)] call FUNC(onLoadGun) },
				"", "", "", -1,
				1, _ali_tar && {_hasShell} && {_typeOfTarget == TARGET_TYPE_GUN} && {count (magazines _target) == 0}],
			[localize "STR_ACE_ARTY_AMMUNITION_UNLOAD_GUN",
				{ [GVAR(target)] spawn FUNC(onUnLoadGun) },
				"", "", "", -1,
				1, _loaded],
			[localize "STR_ACE_ARTY_AMMUNITION_PREP_SHELL",
				{ [GVAR(target)] spawn FUNC(onPrepShell) },
				"", "", "", -1,
				1, _ali_tar && {_typeOfTarget == TARGET_TYPE_SHELL}],
			[localize "STR_ACE_ARTY_AMMUNITION_PACK",
				{ GVAR(packArray) spawn FUNC(packShell) },
				"", "", "", -1,
				1, _ali_tar && {_hasRoom} && {_inRange} && {_typeOfTarget == TARGET_TYPE_SHELL} && {!isNull _BoxShellBelongsTo} && {_magazineToStore != ""}]
		]
	]
];

//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value