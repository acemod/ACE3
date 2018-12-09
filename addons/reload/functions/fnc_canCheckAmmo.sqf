#include "script_component.hpp"
/*
 * Author: CAA-Picard
 * Check if the player can check the ammo of the target.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can link belt<BOOL> 
 *
 * Example:
 * [player, bob] call ace_reload_fnc_canCheckAmmo
 *
 * Public: No
 */

params ["", "_target"];

// Return true for static weapons if they have been fired once, @todo 1.40 this work-around doesn't work anymore
if (_target isKindOf "StaticWeapon") exitWith {
    if (currentMagazine _target != "") exitWith {true};

    // no check ammo action on destroyed static weapons
    if (!alive _target) exitWith {false};

    private _found = false;

    {
        if (_x select 2) exitWith {
            _found = true;
        };
        false
    } count magazinesAmmoFull _target;

    _found
};

// Return false for all other vehicles
if !(_target isKindOf "CAManBase") exitWith {false};

// For men
if (currentWeapon _target == "") exitWith {false};

// Check if their current magazine is a belt
if (getNumber (configFile >> "CfgMagazines" >> currentMagazine _target >> "ACE_isBelt") == 1) exitWith {true};

// Check for rocket launchers
if (currentWeapon _target == secondaryWeapon _target) exitWith {true};

false
