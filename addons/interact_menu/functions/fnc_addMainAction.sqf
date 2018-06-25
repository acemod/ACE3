#include "script_component.hpp"
/*
 * Author: Jonpas, PabstMirror
 * Makes sure there is a ACE_MainActions on the object type
 *
 * Arguments:
 * 0: Object classname <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Table", 0] call ace_interact_menu_fnc_addMainAction;
 *
 * Public: No
 */

params ["_objectType", "_typeNum"];

private _namespace = [GVAR(ActNamespace), GVAR(ActSelfNamespace)] select _typeNum;
private _actionTrees = _namespace getVariable _objectType;
if (isNil "_actionTrees") then {
    _actionTrees = [];
};

private _parentNode = [_actionTrees, ["ACE_MainActions"]] call FUNC(findActionNode);

if (isNil {_parentNode}) then {
    TRACE_2("No Main Action on object", _objectType, _typeNum);
    private _mainAction = ["ACE_MainActions", localize ELSTRING(interaction,MainAction), "", {}, {true}] call FUNC(createAction);
    [_objectType, _typeNum, [], _mainAction] call EFUNC(interact_menu,addActionToClass);
};
