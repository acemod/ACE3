#include "script_component.hpp"
/*
 * Author: commy2
 * Returns item type of given classname.
 *
 * Arguments:
 * 0: Item <STRING>
 *
 * Return Value:
 * 0: Type ("weapon", "item", "magazine", "") <STRING>
 * 1: Item Description <STRING>
 *
 * Example:
 * ["tire"] call ace_common_fnc_getItemType
 *
 * Public: Yes
 */

params ["_item"];

private _config = _item call CBA_fnc_getItemConfig;

if (isNull _config) exitWith {["", ""]};

private _cfgType = configName ((configHierarchy _config) param [1, configNull]);

if (_cfgType == "CfgGlasses") exitWith {["item", "glasses"]};

private _config = configFile >> _cfgType >> _item;
private _type = getNumber (_config >> "type");
private _simulation = getText (_config >> "simulation");

if (isNumber (_config >> "ItemInfo" >> "type")) then {
    _type = getNumber (_config >> "ItemInfo" >> "type");
};

private _default = ["item", "magazine"] select (_cfgType == "CfgMagazines");

switch (true) do {
    case (_type == 0): {[_default, "unknown"]};
    case (_type == TYPE_WEAPON_PRIMARY): {["weapon", "primary"]};
    case (_type == TYPE_WEAPON_HANDGUN): {["weapon", "handgun"]};
    case (_type == TYPE_WEAPON_SECONDARY): {["weapon", "secondary"]};
    case (_type  < TYPE_MAGAZINE_HANDGUN_AND_GL): {["weapon", "unknown"]};
    case (_type == TYPE_MAGAZINE_HANDGUN_AND_GL): {["magazine", "handgun"]}; // handgun
    case (_type == TYPE_MAGAZINE_PRIMARY_AND_THROW): {["magazine", "primary"]}; // rifle
    case (_type == TYPE_MAGAZINE_SECONDARY_AND_PUT): {["magazine", "secondary"]}; // rpg, mg, mines
    //case (_type  < 2^11): {["magazine", "unknown"]};

    case (_type == TYPE_MUZZLE): {["item", "muzzle"]};
    case (_type == TYPE_OPTICS): {["item", "optics"]};
    case (_type == TYPE_FLASHLIGHT): {["item", "flashlight"]};
    case (_type == TYPE_BIPOD): {["item", "under"]}; // czech for bipod item
    case (_type == TYPE_FIRST_AID_KIT): {["item", "first_aid_kit"]};
    case (_type == TYPE_FINS): {["item", "fins"]}; // not implemented
    case (_type == TYPE_BREATHING_BOMB): {["item", "breathing_bomb"]}; // not implemented
    case (_type == TYPE_GOGGLE): {["item", "goggles"]};
    case (_type == TYPE_SCUBA): {["item", "scuba"]}; // not implemented
    case (_type == TYPE_HEADGEAR): {["item", "headgear"]};
    case (_type == TYPE_RADIO): {["item", "radio"]};
    case (_type == TYPE_HMD): {["item", "hmd"]};
    case (_type == TYPE_BINOCULAR): {["item", "binocular"]};
    case (_type == TYPE_MEDIKIT): {["item", "medikit"]};
    case (_type == TYPE_TOOLKIT): {["item", "toolkit"]};
    case (_type == TYPE_UAV_TERMINAL): {["item", "uav_terminal"]};
    case (_type == TYPE_VEST): {["item", "vest"]};
    case (_type == TYPE_UNIFORM): {["item", "uniform"]};

    case (_type == TYPE_BINOCULAR_AND_NVG): {
        switch (toLower _simulation) do {
            case ("weapon"): {["weapon", "binocular"]};
            case ("binocular"): {["weapon", "binocular"]};
            case ("nvgoggles"): {["item", "nvgoggles"]};
            case ("itemminedetector"): {["item", "minedetector"]};
            default {[_default, "unknown"]};
        };
    };

    case (_type == TYPE_WEAPON_VEHICLE): {["weapon", "vehicle"]};
    case (_type == TYPE_ITEM): {
        switch (toLower _simulation) do {
            case ("itemmap"): {["item", "map"]};
            case ("itemgps"): {["item", "gps"]};
            case ("itemradio"): {["item", "radio"]};
            case ("itemcompass"): {["item", "compass"]};
            case ("itemwatch"): {["item", "watch"]};
            default {[_default, "unknown"]};
        };
    };
    default {[_default, "unknown"]};
};
