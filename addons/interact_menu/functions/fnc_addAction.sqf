/*
 * Author: commy2, NouberNou and CAA-Picard
 * Add an ACE action to an object, under a certain config path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 * 3: Name of the action shown in the menu <STRING>
 * 4: Icon <STRING>
 * 5: Position (Position or Selection Name) <POSITION> or <STRING>
 * 6: Statement <CODE>
 * 7: Condition <CODE>
 * 8: Distance <NUMBER>
 * 9: Other parameters <ARRAY> (Optional)
 * 10: Insert children code <CODE> (Optional)
 * 11: Action parameters <ANY> (Optional)
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [cursorTarget,0,["ACE_TapShoulderRight","VulcanPinch"],"Vulcan Pinch","",[0,0,0],{_target setDamage 1;},{true},100] call ace_interact_menu_fnc_addAction;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_9_PVT(_this,_object,_typeNum,_fullPath,_displayName,_icon,_position,_statement,_condition,_distance);

private ["_varName","_actions","_params","_insertChildren","_parameters","_entry"];

_varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
_actions = _object getVariable [_varName, []];
if((count _actions) == 0) then {
    _object setVariable [_varName, _actions];
};

_params = [false,false,false,false];
if (count _this > 9) then {
    _params = _this select 9;
};

_insertChildren = {};
if (count _this > 10) then {
    _insertChildren = _this select 10;
};

_parameters = [];
if (count _this > 11) then {
    _parameters = _this select 11;
};

_entry = [
            [
                _displayName,
                _icon,
                _position,
                _statement,
                _condition,
                _distance,
                _params,
                + _fullPath,
                _insertChildren,
                _parameters
            ],
            []
        ];

_actions pushBack _entry;

_fullPath
