#include "..\script_component.hpp"
/*
 * Author: bux578, commy2
 * Restores previously saved gear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: All Gear based on return value of ace_common_fnc_getAllGear <ARRAY>
 * 2: All weapon info needed for restoring previous weapon status <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, stored_allGear, active_weapon_muzzle_and_mode] call ace_respawn_fnc_restoreGear
 *
 * Public: No
 */

params ["_unit", "_allGear", "_activeWeaponAndMuzzle"];
TRACE_3("restoreGear",_unit,count _allGear,_activeWeaponAndMuzzle);

// Restore all gear
if (!isNil "_allGear") then {
    [_unit, _allGear] call CBA_fnc_setLoadout;
};

// Restore the last active weapon, muzzle and weapon mode
if (!isNil "_activeWeaponAndMuzzle") then {
    _unit selectWeapon _activeWeaponAndMuzzle;
};
