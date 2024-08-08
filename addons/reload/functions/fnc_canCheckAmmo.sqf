#include "..\script_component.hpp"
/*
 * Author: CAA-Picard, johnb43
 * Check if a unit can check the ammo of the target.
 *
 * Arguments:
 * 0: Unit equipped with the weapon/CSW to check <OBJECT>
 * 1: Unit checking ammo <OBJECT>
 *
 * Return Value:
 * Can check ammo <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_reload_fnc_canCheckAmmo
 *
 * Public: No
 */

params ["_target", "_player"];

// Static weapons
if (_target isKindOf "StaticWeapon") exitWith {
    // No check ammo action on destroyed static weapons
    if (!alive _target || {!([_player, _target] call EFUNC(interaction,canInteractWithVehicleCrew))}) exitWith {false};

    if (currentMagazine _target != "") exitWith {true};

    // Check for loaded magazines
    (magazinesAmmoFull _target) findIf {_x select 2} != -1
};

// All other vehicles
if !(_target isKindOf "CAManBase") exitWith {false};

// For men
if (currentWeapon _target == "") exitWith {false};

// Check if their current magazine is a belt
if (getNumber (configFile >> "CfgMagazines" >> currentMagazine _target >> "ACE_isBelt") == 1) exitWith {true};

// Check for rocket launchers
if (currentWeapon _target == secondaryWeapon _target) exitWith {true};

false
