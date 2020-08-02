#include "script_component.hpp"
/*
 * Author: Mysteryjuju
 * Get the adequate texture for a trench
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Texture path <STRING>
 *
 * Example:
 * [] call ace_trenches_fnc_getTrenchTexture
 *
 * Public: No
 */

// If we are on Chernarus Winter, set a beautiful snow texture
if (worldName == "Chernarus_Winter") exitWith {
    selectRandom [
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_les2_detail_co.paa",
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_sterk_detail_co.paa",
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_oranice_detail_co.paa"
    ]
};

// If we are on Thirsk Winter and Chernarus Winter is loaded
if (worldName == "ThirskW" && isClass (configFile >> "CfgWorlds" >> "Chernarus_Winter")) exitWith {
    selectRandom [
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_les2_detail_co.paa",
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_sterk_detail_co.paa",
        "cup\terrains\cup_terrains_maps_chernarus_winter\data\wc_oranice_detail_co.paa"
    ]
};

// Check if RHS PKL is loaded for better textures !
if (isClass (configFile >> "CfgWorlds" >> "rhspkl")) exitWith {
    selectRandom [
        "rhspkl\addons\rhspkl_art\data\ground\blud_elvebunn_co.paa", 
        "rhspkl\addons\rhspkl_art\data\ground\blud_jungle_01_co.paa", 
        "rhspkl\addons\rhspkl_art\data\ground\blud_jungle_02_co.paa"
    ]
};
// Manage old version of PKL
if (isClass (configFile >> "CfgWorlds" >> "prei_khmaoch_luong")) exitWith {
    selectRandom [
        "blud_prei_art\data\ground\blud_elvebunn_co.paa", 
        "blud_prei_art\data\ground\blud_jungle_01_co.paa", 
        "blud_prei_art\data\ground\blud_jungle_02_co.paa"
    ]
};

// Return the default texture
"a3\map_data\gdt_marsh_co.paa"
