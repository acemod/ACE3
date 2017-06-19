/*
 * Author: esteldunedain
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 *
 * Return Value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 *
 * Public: Yes
 */
#include "script_component.hpp"

// IGNORE_PRIVATE_WARNING(_actionName,_displayName,_icon,_statement,_condition,_insertChildren,_customParams,_position,_distance,_params,_modifierFunction);

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
        compile format ["%1", _position];
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
