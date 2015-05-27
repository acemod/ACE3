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

EXPLODE_4_PVT(_this,_objectType,_typeNum,_parentPath,_action);

// Ensure the config menu was compiled first
if (_typeNum == 0) then {
    [_objectType] call FUNC(compileMenu);
} else {
    [_objectType] call FUNC(compileMenuSelfAction);
};

private ["_varName","_actionTrees", "_parentNode"];
_varName = format [[QGVAR(ACE_Actions_%1), QGVAR(ACE_SelfActions_%1)] select _typeNum, _objectType];
_actionTrees = missionNamespace getVariable [_varName, []];
if((count _actionTrees) == 0) then {
    missionNamespace setVariable [_varName, _actionTrees];
};

_parentNode = [_actionTrees, _parentPath] call FUNC(findActionNode);
if (isNil {_parentNode}) exitWith {};

// Add action node as children of the correct node of action tree
(_parentNode select 1) pushBack [_action,[]];

// Return the full path
(+ _parentPath) pushBack (_action select 0)
