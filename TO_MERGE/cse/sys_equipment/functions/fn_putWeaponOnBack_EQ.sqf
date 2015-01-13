/**
 * fn_putWeaponOnBack_EQ.sqf
 * @Descr: Put unit weapon on the back.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

#define MUZZLE_INDEX 100

private ["_unit"];
_unit = _this select 0;
_unit action ["SwitchWeapon", _unit, _unit, MUZZLE_INDEX];

nil;