/*
 * Author: CAA-Picard
 * Check if the player can check the ammo of the target.
 *
 * Argument:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return value:
 * Can link belt<BOOL> 
 *
 * Example:
 * [player, bob] call ace_reload_fnc_canCheckAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_player,_target);

private ["_magazineType", "_magazineCfg"];

// Return true for static weapons if they have been fired once, @todo 1.40 this work-around doesn't work anymore
if (_target isKindOf "StaticWeapon") exitWith {
    if (currentMagazine _target != "") exitWith {true};

    private ["_magazines","_found"];
    _magazines = magazinesAmmoFull _target;
    _found = false;
    {
        if (_x select 2) exitWith {
            _found = true;
        };
    } forEach _magazines;
    _found
};

// Return false for all other vehicles
if !(_target isKindOf "CAManBase") exitWith {false};

// For men
if (currentWeapon _target == "") exitWith {false};

// Check if their current magazine is a belt
_magazineType = currentMagazine _target;
_magazineCfg = configFile >> "CfgMagazines" >> _magazineType;
if (getNumber (_magazineCfg >> "ACE_isBelt") == 1) exitWith {true};

// Check for rocket launchers
if (currentWeapon _target == secondaryWeapon _target) exitWith {true};

false
