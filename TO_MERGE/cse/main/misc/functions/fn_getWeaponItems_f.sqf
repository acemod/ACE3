/**
 * fn_getWeaponItems_f.sqf
 * @Descr: Get the weapon items from the unit.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return:
 * @PublicAPI: false
 */

private "_unit";
_unit = _this select 0;

[primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit];