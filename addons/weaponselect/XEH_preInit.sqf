#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// collect frag and other grenades separately
GVAR(GrenadesAll) = [];
GVAR(GrenadesFrag) = [];
GVAR(GrenadesNonFrag) = [];

private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";
private _cfgThrow = configFile >> "CfgWeapons" >> "Throw";

{
    private _magazines = getArray (_cfgThrow >> _x >> "magazines");

    GVAR(GrenadesAll) append _magazines;

    {
        private _ammo = getText (_cfgMagazines >> _x >> "ammo");
        private _explosive = getNumber (_cfgAmmo >> _ammo >> "explosive");

        ([GVAR(GrenadesFrag), GVAR(GrenadesNonFrag)] select (_explosive == 0)) pushBack _x;
    } forEach _magazines;
} forEach getArray (_cfgThrow >> "muzzles");

#include "initSettings.inc.sqf"

ADDON = true;
