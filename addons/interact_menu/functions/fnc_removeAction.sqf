/*
 * Author: commy2 and NouberNou
 * Remove an action from an object
 *
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Entry to remove <ARRAY> or <NUMBER>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_object,_entry);

private ["_found", "_actions", "_searchFnc"];


if(!IS_OBJECT(_object)) exitWith {false};

_actions = _object getVariable [QUOTE(GVAR(actionData)), []];
if(IS_ARRAY(_entry)) then {
    _entry = _entry select 7;
};

_found = false;
_searchFnc = {
    private ["_actions", "_entry", "_childActions"];
    _actions = _this select 0;
    _entry = _this select 1;
    {
        if((_x select 7) == _entry) then {
            _actions set[_forEachIndex, "aceactiondelete"];
            _actions = _actions - ["aceactiondelete"];
            _found = true;
        } else {
            if(!_found && {count (_x select 6) > 0}) then {
                _childActions = [(_x select 6), _entry] call _searchFnc;
                _x set[6, _childActions];
            };
        };
    } forEach _actions;
    _actions;
};
_actions = [_actions, _entry] call _searchFnc;
_object setVariable [QUOTE(GVAR(actionData)), _actions];

_found;
