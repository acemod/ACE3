/*
 * Author: CAA-Picard
 * Removes a class action from a class
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeClassAction;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_objectType,_typeNum,_fullPath);

private ["_varName","_actions","_parentLevel", "_actionIndex", "_foundAction", "_fnc_findFolder"];

_varName = format [[QGVAR(Act_%1), QGVAR(SelfAct_%1)] select _typeNum, _objectType];
_actions = missionNamespace getVariable [_varName, []];

// Search the class action trees and find where to insert the entry
_parentLevel = _actions;
_actionIndex = -1;
_foundAction = false;

_fnc_findFolder = {
    EXPLODE_3_PVT(_this,_fullPath,_level,_classActions);

    if (count _fullPath == _level + 1) then {
        _parentLevel = _classActions;
    };

    {
        EXPLODE_2_PVT(_x,_actionData,_actionChildren);
        if (((_actionData select 7) select _level) isEqualTo (_fullPath select _level)) exitWith {
            if (_level + 1 == count _fullPath) exitWith {
                _actionIndex = _forEachIndex;
                _foundAction = true;
            };
            [_fullPath, _level + 1, _actionChildren] call _fnc_findFolder;
        };
        if (_foundAction) exitWith {};
    } forEach _classActions;
};

[_fullPath, 0, _actions] call _fnc_findFolder;

// Exit if the action was not found
if (!_foundAction) exitWith {};

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

_parentLevel deleteAt _actionIndex;
