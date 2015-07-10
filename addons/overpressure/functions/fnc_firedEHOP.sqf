/*
 * Author: joko // Jonas
 *
 * Handle fire of Other Weapons
 *
 * Argument:
 * 0: Unit that fired (Object)
 * 1: Weapon fired (String)
 * 2: Muzzle (String)
 * 3: Mode (String)
 * 4: Ammo (String)
 * 5: Magazine (String)
 * 6: Projectile (Object)
 *
 * Return value:
 * None
 */

 if (missionNameSpace getVariable [(QGVAR(Damage) + _this select 1),(([_this select 1,_this select 5] call DFUNC(cacheOverPressureVales)) select 2)]) then {
    _this call DFUNC(fireOverpressureZone)
 };
