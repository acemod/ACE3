/*
 * Author: CAA-Picard
 * Add an ACE action to a class, under a certain path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 * 3: Name of the action shown in the menu <STRING>
 * 4: Icon <STRING>
 * 5: Position (Position or Selection Name) <POSITION> or <STRING>
 * 6: Statement <CODE>
 * 7: Condition <CODE>
 * 8: Distance <NUMBER>
 * 9: Other parameters <ARRAY> (Optional)
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"],"Vulcan Pinch","",[0,0,0],{_target setDamage 1;},{true},100] call ace_interact_menu_fnc_addClassAction;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_9_PVT(_this,_objectType,_typeNum,_fullPath,_displayName,_icon,_position,_statement,_condition,_distance);

// Ensure the config menu was compiled first
if (_typeNum == 0) then {
    [_objectType] call FUNC(compileMenu);
} else {
    [_objectType] call FUNC(compileMenuSelfAction);
};

private ["_varName","_actions","_params","_entry", "_parentLevel", "_foundParentLevel", "_fnc_findFolder"];

_varName = format [[QGVAR(Act_%1), QGVAR(SelfAct_%1)] select _typeNum, _objectType];
_actions = missionNamespace getVariable [_varName, []];
if((count _actions) == 0) then {
    missionNamespace setVariable [_varName, _actions];
};

_params = [false,false,false,false];
if (count _this > 9) then {
    _params = _this select 9;
};

// Search the class action trees and find where to insert the entry
_parentLevel = _actions;
_foundParentLevel = false;

_fnc_findFolder = {
    EXPLODE_3_PVT(_this,_fullPath,_level,_classActions);

    if (count _fullPath == _level + 1) then {
        _parentLevel = _classActions;
        _foundParentLevel = true;
    };

    if (_foundParentLevel) exitWith {};

    {
        EXPLODE_2_PVT(_x,_actionData,_actionChildren);
        if (((_actionData select 7) select _level) isEqualTo (_fullPath select _level)) exitWith {
            // The action should go somewhere in here
            [_fullPath, _level + 1, _actionChildren] call _fnc_findFolder;
        };
    } forEach _classActions;
};

[_fullPath, 0, _actions] call _fnc_findFolder;

// Exit if there's no entry point to insert this action
if (!_foundParentLevel) exitWith {};

_entry = [
            [
                _displayName,
                _icon,
                _position,
                _statement,
                _condition,
                _distance,
                _params,
                + _fullPath
            ],
            []
        ];

_parentLevel pushBack _entry;

_fullPath
