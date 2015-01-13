/*
	NAME: init
	USAGE:
	AUTHOR: Glowbal
	RETURN: void

*/

waituntil{!isnil "cse_gui"};
cse_equip_module = true;
_allowMagazineRepack = true;
_haveAttachableItems = true;
_allowWeaponRest = false;
_allowWeaponSafety = false;
_nvgBrightness = false;
_allowSelectWeaponKeybindings = false;
_allowCheckAmmoKeybindings = false;
CSE_HIDE_AMMO_COUNTERS_EQ = 0;

_args = _this;
{
	_value = _x select 1;
	if (!isnil "_value") then {
		_name = _x select 0;
		if (_name == "magazineRepack") exitwith {
			_allowMagazineRepack = _value;
		};
		if (_name == "attachableItems") exitwith {
			_haveAttachableItems = _value;
		};
		if (_name == "weaponResting") exitwith {
			_allowWeaponRest = _value;
		};
		if (_name == "weaponSafety") exitwith {
			_allowWeaponSafety = _value;
		};
		if (_name == "adjustableNVG") exitwith {
			_nvgBrightness = _value;
		};
		if (_name == "allowWeaponSelect") exitwith {
			_allowSelectWeaponKeybindings = _value;
		};
		if (_name == "allowAmmoChecking") exitwith {
			_allowCheckAmmoKeybindings = _value;
		};
		if (_name == "hideAmmoValues") exitwith {
			CSE_HIDE_AMMO_COUNTERS_EQ = _value;
		};
	};
}foreach _args;

if (_allowSelectWeaponKeybindings) then {
	#include "scripts\select_weapon_keybindings.sqf"
};

if (_allowCheckAmmoKeybindings) then {
	#include "scripts\check_ammo_keybindings.sqf"
};

if (_haveAttachableItems) then {
	#include "scripts\register_attachable_items_actions.sqf"
};

if (_allowMagazineRepack) then {
	#include "scripts\register_magazine_repack_actions.sqf"
};

if (_allowWeaponSafety) then {
	["cse_sys_weaponsafety", []] call cse_fnc_enableModule_f;
};

if (_allowWeaponRest) then {
	["cse_sys_weaponrest", []] call cse_fnc_enableModule_f;
};

if (_nvgBrightness) then {
	["cse_sys_nightvision", []] call cse_fnc_enableModule_f;
};

[format["EQUIP - EQUIPMENT module initialised"],2] call cse_fnc_debug;

if (CSE_HIDE_AMMO_COUNTERS_EQ > 0) then {
	waituntil {!isnil "cse_gui"};
	sleep 0.5;
	if (vehicle player == player) then {
		[true] call cse_fnc_hideUnitInfoAmmo_EQ;
	};
};