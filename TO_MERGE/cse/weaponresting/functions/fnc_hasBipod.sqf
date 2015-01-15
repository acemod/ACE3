/**
 * fn_hasBipod_WR.sqf
 * @Descr: Check if the current weapon has a bipod.
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: []
 * @Return: BOOL weapon has bipod.
 * @PublicAPI: true
 */

 #include "script_component.hpp"

_cseBipod = getNumber(configFile >> "CfgWeapons" >> primaryWeapon player >> "cse_bipod") == 1;
_weaponModeBipod = ["bipod", currentWeaponMode player, false] call BIS_fnc_inString || ["bp", currentWeaponMode player, false] call BIS_fnc_inString;

// TODO: Also check for asdg and kao bipods

_cseBipod || _weaponModeBipod
