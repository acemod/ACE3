#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Ammo/Magazines look-up hash for correctness of initSpeed
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";
private _cfgThrow = configFile >> "CfgWeapons" >> "Throw";

private _ammoMagLookup = createHashMap;

{
    {
        private _ammo = getText (_cfgMagazines >> _x >> "ammo");
        if (_ammo != "") then {
            _ammoMagLookup set [configName (_cfgAmmo >> _ammo), _x];
        };
    } forEach (getArray (_cfgThrow >> _x >> "magazines"));
} forEach (getArray (_cfgThrow >> "muzzles"));

uiNamespace setVariable [QGVAR(ammoMagLookup), compileFinal _ammoMagLookup];
