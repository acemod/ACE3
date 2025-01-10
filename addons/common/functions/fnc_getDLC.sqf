#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Get the DLC information of a class.
 *
 * Arguments:
 * 0: Classname <STRING> or Config <CONFIG>
 * 1: Config root, searches if unspecified or null <CONFIG> (default: configNull)
 *
 * Return Value:
 * DLC Info <ARRAY>
 *   0: DLC Classname <STRING>
 *   1: Steam ID <NUMBER>
 *
 * Example:
 * "launch_NLAW_F" call ace_common_fnc_getDLC
 *
 * Public: Yes
 */

params [["_class", configNull, ["", configNull]], ["_root", configNull, [configNull]]];

private _config = if (_class isEqualType configNull) then {
    _class
} else {
    if !(isNull _root) then {
        _root >> _class
    } else {
        _class call CBA_fnc_getItemConfig
    };
};
if (isNull _config) exitWith {
    ["", 0]
};

if (getNumber (_config >> "ItemInfo" >> "type") == TYPE_UNIFORM) then {
    _config = configFile >> "CfgVehicles" >> getText (_config >> "itemInfo" >> "uniformClass")
};

(getAssetDLCInfo getText (_config >> "model")) params [
    "_isDLC", "", "", "", "_id"
];

if (!_isDLC) exitWith {
    ["", 0]
};

private _name = switch (_id) do {
    case "1021790": { "Enoch" };
    case "395180": { "Expansion" };
    case "304380": { "Heli" };
    case "601670": { "Jets" };
    case "288520": { "Kart" };
    case "332350": { "Mark" };
    case "288520": { "Orange" };
    case "744950": { "Tacops" };
    case "798390": { "Tank" };
    case "1042220": { "GM" };
    case "1227700": { "VN" };
    case "1294440": { "CSLA" };
    case "1681170": { "WS" };
    case "1175380": { "SPE" };
    case "2647760": { "RF" };
    case "2647830": { "EF" };
    default { "" };
};

if !(_id isEqualType 0) then {
    _id = parseNumber _id;
};

[_name, _id]
