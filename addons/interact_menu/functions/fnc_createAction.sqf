/*
 * Author: esteldunedain
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 *
 * Return value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_5_PVT(_this,_actionName,_displayName,_icon,_statement,_condition);

// IGNORE_PRIVATE_WARNING(_target);
private ["_insertChildren","_customParams","_position","_distance","_params", "_modifierFunction"];

_insertChildren = if (count _this > 5) then {
    _this select 5
} else {
    {}
};

_customParams = if (count _this > 6) then {
    _this select 6
} else {
    []
};

_position = if (count _this > 7) then {
    if (typeName (_this select 7) == "STRING") then {
        // If the action is set to a selection, create the suitable code
        compile format ["_target selectionPosition '%1'", _this select 7];
    } else {
        if (typeName (_this select 7) == "ARRAY") then {
            // If the action is set to a array position, create the suitable code
            compile format ["%1", _this select 7];
        } else {
            _this select 7
        };
    }
} else {
    {[0,0,0]}
};

_distance = if (count _this > 8) then {
    _this select 8
} else {
    2
};

_params = if (count _this > 9) then {
    _this select 9
} else {
    [false,false,false,false]
};

_modifierFunction =  if (count _this > 10) then {
    _this select 10
} else {
    {}
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
