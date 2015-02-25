/*
 * Author: commy2 and NouberNou
 * Add an ACE action to an object or inside a parent action. Note: This function is NOT global.
 *
 * Argument:
 * 0: Object the action should be assigned to or parent action <OBJECT> or <ARRAY>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Position (Position or Selection Name) <POSITION> or <STRING>
 * 4: Statement <CODE>
 * 5: Condition <CODE>
 * 6: Distance <NUMBER>
 *
 * Return value:
 * The entry array, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_7_PVT(_this,_object,_displayName,_icon,_position,_statement,_condition,_distance);


private ["_actions","_entry"];
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
