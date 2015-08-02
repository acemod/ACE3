/*
 * Author: Jonpas, PabstMirror
 * Makes sure there is a ACE_MainActions on the object type
 *
 * Argument:
 * 0: Object classname <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * ["Table", 0] call ace_interact_menu_fnc_addMainAction;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_objectType,_typeNum);

private["_actionTrees", "_mainAction", "_parentNode", "_varName"];

_varName = format [[QGVAR(Act_%1), QGVAR(SelfAct_%1)] select _typeNum, _objectType];
_actionTrees = missionNamespace getVariable [_varName, []];
_parentNode = [_actionTrees, ["ACE_MainActions"]] call FUNC(findActionNode);

if (isNil {_parentNode}) then {
    TRACE_2("No Main Action on object", _objectType, _typeNum);
    _mainAction = ["ACE_MainActions", localize ELSTRING(interaction,MainAction), "", {}, {true}] call FUNC(createAction);
    [_objectType, _typeNum, [], _mainAction] call EFUNC(interact_menu,addActionToClass);
};
