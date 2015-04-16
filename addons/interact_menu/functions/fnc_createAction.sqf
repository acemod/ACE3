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
 * 7: Position (Position or Selection Name) <POSITION> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters <ARRAY> (Optional)
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

private ["_insertChildren","_customParams","_position","_distance","_params"];

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
    _this select 7
} else {
    [0,0,0]
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
    _params
]
