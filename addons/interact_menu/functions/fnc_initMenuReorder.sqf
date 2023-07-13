#include "script_component.hpp"
/*
 * Author: Dystopian
 * Initializes "More" and "Move to Root" settings and menu.
 *
 * Arguments:
 * 0: Class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [typeOf player] call ace_interact_menu_fnc_initMenuReorder
 *
 * Public: No
 */

params ["_class"];

private _actionTrees = GVAR(ActSelfNamespace) getVariable _class;
private _rootNode = [_actionTrees, ["ACE_SelfActions"]] call FUNC(findActionNode);
private _rootActions = _rootNode select 1;
private _settingCategoryPrefix = format ["ACE %1 - ", LELSTRING(Interaction,InteractionMenuSelf)];


// init "Move to Root" settings
private _settingCategory = _settingCategoryPrefix + localize "STR_3DEN_Display3DEN_RemoveLayer_tooltip";

private _fnc_processNode = {
    params ["_node", "_parentVarName", "_titlePrefix", "_parentConditionString"];

    _node params ["_actionData", "_actionChildren"];
    _actionData params ["_name", "_title", "", "", "_condition"];
    private _varName = _parentVarName + "__" + _name;
    private _titleFull = _titlePrefix + _title;
    private _conditionFullString = format ["%1 && {%2}", _parentConditionString, _condition call EFUNC(common,codeToString)];

    // don't add already added setting
    if (isNil {missionNamespace getVariable _varName}) then {
        [_varName, "CHECKBOX", _titleFull, [_settingCategory, _rootActionTitle], false, 2, {}, true] call CBA_fnc_addSetting;
    };

    if (missionNamespace getVariable [_varName, false]) then {
        private _newActionData = +(_actionData);
        _newActionData set [4, compile _conditionFullString];
        _rootActions pushBack [_newActionData, _actionChildren];
    };

    {
        [_x, _varName, _titleFull + " / ", _conditionFullString] call _fnc_processNode;
    } forEach _actionChildren;
};

private _rootActionsCount = count _rootActions;
{
    _x params ["_actionData", "_actionChildren"];
    _actionData params ["_name", "_rootActionTitle", "", "", "_condition"];
    private _parentVarName = QGVAR(moveToRoot__) + _name;
    private _conditionString = _condition call EFUNC(common,codeToString);
    {
        [_x, _parentVarName, "", _conditionString] call _fnc_processNode;
    } forEach _actionChildren;
} forEach _rootActions;


// init "More" menu
private _action = [QGVAR(more), localize "str_more_menu", "", {}, {true}] call FUNC(createAction);
private _morePath = [_class, 1, ["ACE_SelfActions"], _action] call FUNC(addActionToClass);
private _moreNode = [_actionTrees, _morePath] call FUNC(findActionNode);
private _moreActions = _moreNode select 1;
private _settingCategory = _settingCategoryPrefix + localize "str_more_menu";

{
    // prevent moved to root actions processing
    if (_forEachIndex >= _rootActionsCount) then {break};

    _x params ["_actionData", "_actionChildren"];
    _actionData params ["_name", "_title"];
    if (_name isEqualTo QGVAR(more)) then {continue};

    private _varName = QGVAR(more__) + _name;
    [_varName, "CHECKBOX", _title, _settingCategory, false, 2, {}, true] call CBA_fnc_addSetting;
    if !(missionNamespace getVariable [_varName, false]) then {continue};

    private _newActionData = +(_actionData);
    // disable action instead of deleting because it can be used as parent lately
    _actionData set [4, {false}];
    _moreActions pushBack [_newActionData, _actionChildren];
} forEach _rootActions;
