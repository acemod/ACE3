/*
 * Author: commy2
 *
 * Add an ACE action to an object. Note: This function is NOT global.
 *
 * Argument:
 * 0: Object the action should be assigned to (Object)
 * 1: Name of the action shown in the menu (String)
 * 2: Icon (String)
 * 3: Position (Position or Selection Name)
 * 4: Statement (Code)
 * 5: Condition (Code)
 * 6: Distance (Number)
 *
 * Return value:
 * The entry array, which can be used to remove the entry, or add children entries.
 */
#include "script_component.hpp"

private ["_object", "_displayName", "_icon", "_position", "_statement", "_condition", "_distance", "_actions", "_entry"];
_object         = _this select 0;
_displayName    = _this select 1;
_icon           = _this select 2;
_position       = _this select 3;
_statement      = _this select 4;
_condition      = _this select 5;
_distance       = _this select 6;

_actions = [];
if(IS_OBJECT(_object)) then {
    _actions = _object getVariable [QUOTE(GVAR(actionData)), []];
    if((count _actions) == 0) then {
        _object setVariable [QUOTE(GVAR(actionData)), _actions]
    };
} else {
    if(IS_ARRAY(_object)) then {
        _actions = _object select 6;
    };
};

_entry = [
            _displayName,
            _icon,
            _position,
            _statement,
            _condition,
            _distance,
            [],
            GVAR(uidCounter)
        ];
GVAR(uidCounter) = GVAR(uidCounter) + 1;
_actions pushBack _entry;
_entry;