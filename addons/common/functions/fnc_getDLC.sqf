#include "..\script_component.hpp"
/*
 * Author: POLPOX, Brett Mayson
 * Get the DLC information of a class.
 *
 * Arguments:
 * 0: Classname <STRING>
 * 1: Config root <CONFIG> Searches if unspecified
 *
 * Return Value:
 * DLC Info <ARRAY>
 *   0: DLC Classname <STRING>
 *   1: Steam ID <NUMBER>
 *
 * Example:
 * "launch_NLAW_F" call ace_arsenal_fnc_getDLC
 *
 * Public: Yes
 *
 * Originally from https://steamcommunity.com/sharedfiles/filedetails/?id=1978434625
 * Used under APL-SA License
 */

params ["_class", ["_root", configNull]];

private _dlcList = [
    ["_f_contact\","Enoch"],
    ["_f_enoch\","Enoch"],
    ["_f_exp\","Expansion"],
    ["_f_heli\","Heli"],
    ["_f_jets\","Jets"],
    ["_f_kart\","Kart"],
    ["_f_mark\","Mark"],
    ["_f_orange\","Orange"],
    ["_f_tacops\","Tacops"],
    ["_f_tank\","Tank"],
    ["_f_lxws\", "WS"],
    ["_f_vietnam\","VN"],
    ["_f_csla\","CSLA"],
    ["_f_2p16\","GM"],
    ["ww2_spe_", "SPE"],
    ["_rf\", "RF"],
    ["_ef\", "EF"], // Assumed, needs confirmation
    ["_csla\", "CSLA"] // Assumed, needs confirmation
];
private _whitelist = [
    "weapons_f_tank",
    "suitpack_scientist_02",
    "acc\acco_mrd" // Different model added by RF
];
private _config = if (_class isEqualType configNull) then {
    _class
} else {
    if !(isNull _root) then {
        _root >> _class
    } else {
        _class call CBA_fnc_getItemConfig
    };
};
if (isNull _config || !(isClass _config)) exitWith {
    ["", 0]
};

if (getNumber (_config >> "itemInfo" >> "type") == TYPE_UNIFORM) then {
    _config = configFile >> "CfgVehicles" >> getText (_config >> "itemInfo" >> "uniformClass")
};

private _model = toLower getText (_config >> "model");
if (_whitelist findIf { _x in _model } != -1) exitWith {
    ["", 0]
};
private _return = "";
{
    if ((_x select 0) in _model) exitWith {
        _return = _x select 1;
    };
} forEach _dlcList;

private _id = switch (_return) do {
    case "Enoch": { 1021790 };
    case "Expansion": { 3951810 };
    case "Heli": { 304380 };
    case "Jets": { 601670 };
    case "Kart": { 288520 };
    case "Mark": { 332350 };
    case "Orange": { 288520 };
    case "Tacops": { 744950 };
    case "Tank": { 798390 };
    case "GM": { 1042220 };
    case "VN": { 1227700 };
    case "CSLA": { 1294440 };
    case "WS": { 1681170 };
    case "SPE": { 1175380 };
    case "RF": { 2647760 };
    case "EF": { 2647830 };
    default { 0 };
};

[_return, _id]
