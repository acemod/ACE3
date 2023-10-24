#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Statement to filter weapons by their type.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 * 1: Type (options are "hgun", "arifle", "srifle", "mg", "missile", "rocket", "other") <STRING>
 *
 * Return Value:
 * Passed filter <BOOL>
 *
 * Public: No
*/

params ["_config", "_targetType"];

private _definedTypes = ["hgun", "arifle", "srifle", "mg", "missile", "rocket"];

private _type = getText (_config >> "cursor");

switch (true) do {
    case (_type == _targetType): {
        true
    };
    case (_targetType == "other" && {!(_type in _definedTypes)}): {
        true
    };
    default {
        false
    };
};
