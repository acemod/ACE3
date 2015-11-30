#include "script_component.hpp"

ADDON = false;

PREP(displayGrenadeTypeAndNumber);
PREP(fireSmokeLauncher);
PREP(playChangeFiremodeSound);
PREP(putWeaponAway);
PREP(selectNextGrenade);
PREP(selectWeaponMode);
PREP(selectWeaponMuzzle);
PREP(selectWeaponVehicle);
PREP(throwGrenade);

// collect frag and other grenades separately
GVAR(GrenadesAll)     = [];
GVAR(GrenadesFrag)    = [];
GVAR(GrenadesNonFrag) = [];

private ["_magazines", "_ammo", "_explosive"];

{
    _magazines = getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");

    GVAR(GrenadesAll) append _magazines;

    {
        _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
        _explosive = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive");

        ([GVAR(GrenadesFrag), GVAR(GrenadesNonFrag)] select (_explosive == 0)) pushBack _x;
        false
    } count _magazines;
    false
} count getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

ADDON = true;
