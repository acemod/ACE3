/*
 * Author: esteldunedain
 * Insert an ACE action to an object, under a certain config path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToObject;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_typeNum", "_parentPath", "_action"];

private ["_varName","_actionList"];
_varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
_actionList = _object getVariable [_varName, []];
if((count _actionList) == 0) then {
    _object setVariable [_varName, _actionList];
};

// Add action and parent path to the list of object actions
_actionList pushBack [_action, +_parentPath];

// Return the full path
(+ _parentPath) pushBack (_action select 0)
