/*
 * Author: Tuupertunut
 * Sets the ammo counts of all magazines of given class in turret.
 *
 * BIS command "setMagazineTurretAmmo" is broken at the time of writing (2017-06-24)
 * (https://feedback.bistudio.com/T79689). This function is intended as a workaround for it. All
 * magazines are removed and then added again with updated ammo counts.
 * Note: As an unintended side effect, the turret reloads after running this function.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magazine Classname <STRING>
 * 3: Ammo Counts in Magazines <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, [0], "200Rnd_127x99_mag_Tracer_Red", [200, 152]] call ace_rearm_fnc_setTurretMagazineAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_turretPath", [], [[]]],
    ["_magazineClass", "", [""]],
    ["_ammoCounts", [], [[]]]
];

// Checking if a magazine of given class is currently loaded in any weapon.
private _magLoadedInWeapon = false;
private _loadedWeapon = "";
{
    private _currentlyLoadedMag = (weaponState [_vehicle, _turretPath, _x]) select 3;
    
    if (_currentlyLoadedMag isEqualTo _magazineClass) exitWith {
        _magLoadedInWeapon = true;
        _loadedWeapon = _x;
    };
} forEach (_vehicle weaponsTurret _turretPath);

// Setting the ammo counts by removing and then adding new magazines with updated ammo counts.
_vehicle removeMagazinesTurret [_magazineClass, _turretPath];
{
    _vehicle addMagazineTurret [_magazineClass, _turretPath, _x];
} forEach _ammoCounts;

/* If a magazine of given class was loaded into a weapon, and the weapon has more than one type of
 * magazine (e.g. AP and HEAT in a cannon), then removing all magazines has triggered the weapon to
 * load a different magazine type. For example, setting the ammo count of HEAT shells while HEAT is
 * loaded makes the cannon switch to AP. To prevent that, we must load back the original magazine
 * type. */
if (_magLoadedInWeapon) then {
    _vehicle loadMagazine [_turretPath, _loadedWeapon, _magazineClass];
};

TRACE_5("setTurretMagazineAmmo", _vehicle, _turretPath, _magazineClass, _ammoCounts, _loadedWeapon);
