#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds custom tag. Has to be executed on one machine only.
 *
 * Arguments:
 * 0: Unique Identifier <STRING>
 * 1: Display Name <STRING>
 * 2: Required Item <STRING>
 * 3: Textures Paths <ARRAY>
 * 4: Icon Path <STRING> (default: "")
 * 5: Material Paths <ARRAY> (default: [])
 * 6: Tag Model <STRING> (default: "ace_tagging_texture1m")
 * 7: Condition for the spraytag <CODE> (default: {true})
 *
 * Return Value:
 * Successfully Added Tag <BOOL>
 *
 * Example:
 * ["ace_victoryRed", "Victory Red", "ACE_SpraypaintRed", ["path\to\texture1.paa", "path\to\texture2.paa"], "path\to\icon.paa"] call ace_tagging_fnc_addCustomTag
 *
 * Public: Yes
 */

params [
    ["_identifier", "", [""]],
    ["_displayName", "", [""]],
    ["_requiredItem", "", [""]],
    ["_textures", [], [[]]],
    ["_icon", "", [""]],
    ["_materials", [], [[]]],
    ["_tagModel", QGVAR(texture1m), [""]],
    ["_condition", {true}, [{}]]
];

// Verify
if (_identifier == "") exitWith {
    ERROR("Failed adding custom tag - missing identifier"); false
};

if (_displayName == "") exitWith {
    ERROR_1("Failed adding custom tag: %1 - missing displayName",_identifier); false
};

if (_requiredItem == "") exitWith {
    ERROR_1("Failed adding custom tag: %1 - missing requiredItem",_identifier); false
};
if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) exitWith {
    ERROR_2("Failed adding custom tag: %1 - requiredItem %2 does not exist",_identifier,_requiredItem); false
};

if (_textures isEqualTo []) exitWith {
    ERROR_1("Failed adding custom tag: %1 - missing textures",_identifier); false
};

if !(([objNull,objNull] call _condition) isEqualType true) exitWith {
    ERROR_1("Failed adding custom tag: %1 - custom Condition does not return boolean",_identifier); false
};

_identifier = [_identifier] call CBA_fnc_removeWhitespace;

// Add
[QGVAR(applyCustomTag), [_identifier, _displayName, _requiredItem, _textures, _icon, _materials, _tagModel, _condition]] call CBA_fnc_globalEventJIP;

true
