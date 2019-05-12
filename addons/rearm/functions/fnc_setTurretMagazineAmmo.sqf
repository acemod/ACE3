#include "script_component.hpp"
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
 * 3: Ammo Counts in Magazines <ARRAY of NUMBERs>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, [0], "200Rnd_127x99_mag_Tracer_Red", [200, 152]] call ace_rearm_fnc_setTurretMagazineAmmo
 *
 * Public: No
 */

params ["_vehicle", "_turretPath", "_magazineClass", "_ammoCounts"];

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


if (!_magLoadedInWeapon) then {
    /* The easy case:
     * The magazine class was not loaded, so we can just remove those magazines and
     * add them back with updated ammo counts. */

    _vehicle removeMagazinesTurret [_magazineClass, _turretPath];
    {
        _vehicle addMagazineTurret [_magazineClass, _turretPath, _x];
    } forEach _ammoCounts;
} else {
    /* Special hack case:
     * The magazine class was loaded into a weapon. If the weapon has more than one type of
     * magazine (e.g. AP and HEAT in a cannon), then removing all magazines would trigger the
     * weapon to load a different magazine type. For example, removing the HEAT shells while HEAT
     * is loaded makes the cannon switch to AP.
     *
     * To prevent that, we must remove all magazines that would fit into the weapon and then add
     * them back with the magazine-to-be-loaded being the first. */

    private _allowedMagClassesInWeapon = [_loadedWeapon] call CBA_fnc_compatibleMagazines;

    /* Current ammo counts of all allowed magazine classes in weapon.
     * Example: [["8Rnd_82mm_Mo_shells", [8, 8, 2]], ["8Rnd_82mm_Mo_Flare_white", [7]]] */
    private _ammoCountsByMagClass = _allowedMagClassesInWeapon apply {[_x, ([_vehicle, _turretPath, _x] call FUNC(getTurretMagazineAmmo))]};

    // Removing all magazines that fit into the weapon.
    {
        _vehicle removeMagazinesTurret [_x, _turretPath];
    } forEach _allowedMagClassesInWeapon;

    // Adding the mags of the given class first with updated ammo counts.
    {
        _vehicle addMagazineTurret [_magazineClass, _turretPath, _x];
    } forEach _ammoCounts;

    // Adding back all other magazines with their original ammo counts.
    {
        _x params ["_loopMagClass", "_loopAmmoCounts"];

        if (!(_loopMagClass isEqualTo _magazineClass)) then {
            {
                _vehicle addMagazineTurret [_loopMagClass, _turretPath, _x];
            } forEach _loopAmmoCounts;
        };
    } forEach _ammoCountsByMagClass;
};

TRACE_5("setTurretMagazineAmmo",_vehicle,_turretPath,_magazineClass,_ammoCounts,_loadedWeapon);
