/**
 * fn_getMuzzleAccessory_DEAF.sqf
 * @Descr: N/A Throws exception NO_WEAPON_UNIT
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: STRING classname. Empty string if no assescory for Muzzle
 * @PublicAPI: false
 */

 private ["_unit"];
_unit = _this select 0;
_accessories = [_unit] call cse_fnc_getWeaponItems_F;
_items = switch (currentWeapon _unit) do {
    case (primaryWeapon _unit): { _accessories select 0 };
    case (secondaryWeapon _unit): { _accessories select 1 };
    case (handgunWeapon _unit): { _accessories select 2 };
    default { throw "NO_WEAPON_UNIT"; };
};
(_items select 0);