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
#include "script_component.hpp"

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
    case (_type == 2^0): {["weapon", "primary"]};
    case (_type == 2^1): {["weapon", "handgun"]};
    case (_type == 2^2): {["weapon", "secondary"]};
    case (_type  < 2^4): {["weapon", "unknown"]};
    case (_type == 2^4): {["magazine", "handgun"]}; // handgun
    case (_type == 2^8): {["magazine", "primary"]}; // rifle
    case (_type == 2^9): {["magazine", "secondary"]}; // rpg, mg, mines
    //case (_type  < 2^11): {["magazine", "unknown"]};

    case (_type == 101): {["item", "muzzle"]};
    case (_type == 201): {["item", "optics"]};
    case (_type == 301): {["item", "flashlight"]};
    case (_type == 302): {["item", "under"]}; // czech for bipod item
    case (_type == 401): {["item", "first_aid_kit"]};
    case (_type == 501): {["item", "fins"]}; // not implemented
    case (_type == 601): {["item", "breathing_bomb"]}; // not implemented
    case (_type == 603): {["item", "goggles"]};
    case (_type == 604): {["item", "scuba"]}; // not implemented
    case (_type == 605): {["item", "headgear"]};
    case (_type == 611): {["item", "radio"]};
    case (_type == 616): {["item", "hmd"]};
    case (_type == 617): {["item", "binocular"]};
    case (_type == 619): {["item", "medikit"]};
    case (_type == 620): {["item", "toolkit"]};
    case (_type == 621): {["item", "uav_terminal"]};
    case (_type == 701): {["item", "vest"]};
    case (_type == 801): {["item", "uniform"]};

    case (_type == 2^12): {
        switch (toLower _simulation) do {
            case ("weapon"): {["weapon", "binocular"]};
            case ("binocular"): {["weapon", "binocular"]};
            case ("nvgoggles"): {["item", "nvgoggles"]};
            case ("itemminedetector"): {["item", "minedetector"]};
            default {[_default, "unknown"]};
        };
    };

    case (_type == 2^16): {["weapon", "vehicle"]};
    case (_type == 2^17): {
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
