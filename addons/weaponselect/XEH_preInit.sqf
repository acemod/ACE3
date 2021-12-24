#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// collect frag and other grenades separately
GVAR(GrenadesAll) = [];
GVAR(GrenadesFrag) = [];
GVAR(GrenadesNonFrag) = [];
GVAR(GrenadesFlash) = [];
GVAR(GrenadesIncendiary) = [];

// micro-optimization
private _cfgAmmo = configFile >> "CfgAmmo";
private _cfgWeaponsThrow = configFile >> "CfgWeapons" >> "Throw";
private _cfgMagazines = configFile >> "CfgMagazines";

{
    private _magazines = getArray (_cfgWeaponsThrow >> _x >> "magazines");
    GVAR(GrenadesAll) append _magazines;
    {
        private _ammo = getText (_cfgMagazines >> _x >> "ammo");

        private _explosive = getNumber (_cfgAmmo >> _ammo >> "explosive") > 0;
        private _flashbang = getNumber (_cfgAmmo >> _ammo >> QEGVAR(grenades,flashbang)) == 1;
        private _incendiary = getNumber (_cfgAmmo >> _ammo >> QEGVAR(grenades,incendiary)) == 1;

        switch (true) do {
            case (_flashbang): { GVAR(GrenadesFlash) pushBack _x };
            case (_incendiary): { GVAR(GrenadesIncendiary) pushBack _x };
            case (_explosive): { GVAR(GrenadesFrag) pushBack _x };
            default { GVAR(GrenadesNonFrag) pushBack _x };
        };
    } forEach _magazines;
} forEach getArray (_cfgWeaponsThrow >> "muzzles");

{
    GVAR(GrenadesNonFrag) append _x;
} forEach [GVAR(GrenadesFlash), GVAR(GrenadesIncendiary)];

#include "initSettings.sqf"

ADDON = true;
