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

private ["_varName","_actions"];

_varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
_actions = _object getVariable [_varName, []];
if((count _actions) == 0) then {
    _object setVariable [_varName, _actions];
};

private "_entry";
_entry = [
            [
                _displayName,
                _icon,
                _position,
                _statement,
                _condition,
                _distance,
                [false,false,false],
                + _fullPath
            ],
            []
        ];

_actions pushBack _entry;

_fullPath
