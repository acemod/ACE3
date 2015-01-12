/**
 * fn_hasMuzzleAccessory_DEAF.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
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
(_items select 0) != "";