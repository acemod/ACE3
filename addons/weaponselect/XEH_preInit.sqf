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

GVAR(GrenadesAll) = compatibleMagazines "throw";

GVAR(GrenadesNonFrag) = GVAR(GrenadesAll) select {getNumber (_cfgAmmo >> getText (_cfgMagazines >> _x >> "ammo") >> "explosive") == 0};
GVAR(GrenadesFrag) = GVAR(GrenadesAll) - GVAR(GrenadesNonFrag);

#include "initSettings.inc.sqf"

ADDON = true;
