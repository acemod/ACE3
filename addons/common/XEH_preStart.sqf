#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (isFilePatchingEnabled) then {
    private _notLoaded = configProperties [configFile >> "ace_notLoaded", "isText _x"];
    {
        INFO_2("%1 not loaded because %2",configName _x,getText _x);
    } forEach _notLoaded;
};

// These functions are used for the ace arsenal, one of which are called in preStart (ace_arsenal_fnc_scanConfig)
// Cache for FUNC(getAddon)
uiNamespace setVariable [QGVAR(addonCache), createHashMap];

// Cache for FUNC(getConfigName)
uiNamespace setVariable [QGVAR(configNames), createHashMap];

//Add warnings for missing compat PBOs
GVAR(isModLoadedCache) = createHashMap;
{
    _x params ["_modPBO", "_compatPBO"];
    if ([_modPBO] call FUNC(isModLoaded) && {!([_compatPBO] call FUNC(isModLoaded))}) then {
        WARNING_2("Weapon Mod [%1] missing ace compat pbo [%2]",_modPBO,_compatPBO);
    };
} forEach [
    ["CUP_Creatures_People_LoadOrder","ace_compat_cup_units"],
    ["CUP_Vehicles_LoadOrder","ace_compat_cup_vehicles"],
    ["CUP_Weapons_LoadOrder","ace_compat_cup_weapons"],
    ["r3f_armes_c","ace_compat_r3f"],
    ["RF_Data_Loadorder","ace_compat_rf"],
    ["RH_acc","ace_compat_rh_acc"],
    ["RH_de_cfg","ace_compat_rh_de"],
    ["RH_m4_cfg","ace_compat_rh_m4"],
    ["RH_PDW","ace_compat_rh_pdw"],
    ["RKSL_PMII","ace_compat_rksl_pm_ii"],
    ["iansky_opt","ace_compat_sma3_iansky"],
    ["R3F_Armes","ace_compat_r3f"]
];
