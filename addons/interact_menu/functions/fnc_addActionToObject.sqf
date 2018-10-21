#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Insert an ACE action to an object, under a certain config path
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return Value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToObject;
 *
 * Public: Yes
 */

if (!params [["_object", objNull, [objNull]], ["_typeNum", 0, [0]], ["_parentPath", [], [[]]], ["_action", [], [[]], 11]]) exitWith {
    ERROR("Bad Params");
    []
};

private _varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
private _actionList = _object getVariable [_varName, []];

if (_actionList isEqualTo []) then {
    _object setVariable [_varName, _actionList];
};

// Ensure the config menu was compiled first
if (_typeNum == 0) then {
    [_object] call FUNC(compileMenu);
} else {
    [_object] call FUNC(compileMenuSelfAction);
};

if (_parentPath isEqualTo ["ACE_MainActions"]) then {
    [(typeOf _object), _typeNum] call FUNC(addMainAction);
};

// Add action and parent path to the list of object actions
_actionList pushBack [_action, +_parentPath];

// Return the full path
(_parentPath + [_action select 0])
