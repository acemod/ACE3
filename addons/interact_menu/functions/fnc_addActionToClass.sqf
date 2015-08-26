/*
 * Author: esteldunedain
 * Insert an ACE action to a class, under a certain path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [typeOf cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToClass;
 *
 * Public: No
 */
#include "script_component.hpp"

if (!params [["_objectType", "", [""]], ["_typeNum", 0, [0]], ["_parentPath", [], [[]]], ["_action", [], [[]], 11]]) exitWith {
    ERROR("Bad Params");
};

// Ensure the config menu was compiled first
if (_typeNum == 0) then {
    [_objectType] call FUNC(compileMenu);
} else {
    [_objectType] call FUNC(compileMenuSelfAction);
};

private ["_varName","_actionTrees", "_parentNode"];
_varName = format [[QGVAR(Act_%1), QGVAR(SelfAct_%1)] select _typeNum, _objectType];
_actionTrees = missionNamespace getVariable [_varName, []];
if((count _actionTrees) == 0) then {
    missionNamespace setVariable [_varName, _actionTrees];
};

if (_parentPath isEqualTo ["ACE_MainActions"]) then {
    [_objectType, _typeNum] call FUNC(addMainAction);
};

_parentNode = [_actionTrees, _parentPath] call FUNC(findActionNode);
if (isNil {_parentNode}) exitWith {
    ERROR("Failed to add action");
    ACE_LOGERROR(format ["action (%1) to parent %2 on object %3 [%4]", (_action select 0), _parentPath, _objectType, _typeNum]);
};

// Add action node as children of the correct node of action tree
(_parentNode select 1) pushBack [_action,[]];

// Return the full path
(+ _parentPath) pushBack (_action select 0)
