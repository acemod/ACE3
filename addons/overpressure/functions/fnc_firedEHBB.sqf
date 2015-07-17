/*
 * Author: joko // Jonas
 *
 * Handle fire of local launchers
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
 private ["_var","_varName"];
 _varName = (QGVAR(values) + _this select 1);
 _var = if (isNil _varName) then {
     ([_this select 1,_this select 5] call FUNC(cacheOverPressureVales)) select 2;
 } else {
     (missionNameSpace getVariable _varName) select 2;
 };
  if (_var > 0) then {
    _this call DFUNC(fireLauncherBackblast)
 };
