#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon file path or Array of icon file path and hex color ("" for default icon) <STRING|ARRAY>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (default: {})
 * 6: Action parameters <ANY> (default: [])
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (default: {[0, 0, 0]})
 * 8: Distance <NUMBER> (default: 2)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (default: all false)
 * 10: Modifier function <CODE> (default: {})
 *
 * Return Value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 *
 * Public: Yes
 */

// IGNORE_PRIVATE_WARNING(_actionName,_displayName,_icon,_statement,_condition,_insertChildren,_customParams,_position,_distance,_params,_modifierFunction);

if (!hasInterface) exitWith { [] };
params [
    "_actionName",
    "_displayName",
    "_icon",
    "_statement",
    "_condition",
    ["_insertChildren", {}],
    ["_customParams", []],
    ["_position", {[0, 0, 0]}],
    ["_distance", 2],
    ["_params", [false, false, false, false, false]],
    ["_modifierFunction", {}]
];

_position = if (_position isEqualType "") then {
    // If the action is set to a selection, create the suitable code - IGNORE_PRIVATE_WARNING(_target);
    compile format ["_target selectionPosition '%1'", _position];
} else {
    if (_position isEqualType []) then {
        // If the action is set to a array position, create the suitable code
        compile str _position;
    } else {
        _position;
    };
};

[
    _actionName,
    _displayName,
    _icon,
    _statement,
    _condition,
    _insertChildren,
    _customParams,
    _position,
    _distance,
    _params,
    _modifierFunction
]
