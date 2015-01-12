/**
 * fn_safetyOff_ws.sqf
 * @Descr: Puts the given unit/weapon/muzzle combination on fire
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING]
 * @Return: nil
 * @PublicAPI: true
 */
 
 
private ["_unit", "_weapon", "_muzzle"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

_unit setVariable [format["CSE_WeaponSafety_%1_%2", _weapon, _muzzle], false, false];
playSound "click";
