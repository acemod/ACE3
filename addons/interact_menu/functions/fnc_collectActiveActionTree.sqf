#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Collect a entire tree of active actions
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Original action tree <ARRAY>
 * 2: Parent path <ARRAY>
 * 3: Distance to base point (will be 0 for self/zeus/in-vehicle) <NUMBER>
 *
 * Return Value:
 * Active children <ARRAY>
 *
 * Example:
 * [bob, [array], [array], 5] call ACE_interact_menu_fnc_collectActiveActionTree
 *
 * Public: No
 */

params ["_object", "_origAction", "_parentPath", "_distanceToBasePoint"];
_origAction params ["_origActionData", "_origActionChildren"];

private _target = _object;
private _player = ACE_player;

// Check if the function should be modified first
if ((_origActionData select 10) isNotEqualTo {}) then {
    // It should, so make a copy and pass it to the modifierFunction
    _origActionData = +_origActionData;
    private _actionParams = _origActionData select 6; // Define _actionParams so its accessible within the statement/condition
    [_target, ACE_player, _actionParams, _origActionData] call (_origActionData select 10);
};

_origActionData params [
    "_actionName",
    "_displayName",
    "",
    "_statementCode",
    "_conditionCode",
    "_insertChildrenCode",
    "_customParams",
    "_position",
    "_distance"
];

private _result = [_target, ACE_player, _customParams] call _conditionCode;

// Handle nil as false
if (isNil "_result") then {
    ERROR_1("Action [%1] bad condition return",_actionName);

    _result = false;
};

// Return nothing if the action itself is not active
if (!_result) exitWith {
    []
};

// Return nothing if the action is too far (including checking sub actions) [DISABLED FOR NOW ref #2196]
// if (_distanceToBasePoint > _distance) exitWith {
    // []
// };

private _fullPath = +_parentPath;
_fullPath pushBack _actionName;
private _activeChildren = [];

// If there's a statement to dynamically insert children then execute it
if (_insertChildrenCode isNotEqualTo {}) then {
    private _dynamicChildren = [_target, ACE_player, _customParams] call _insertChildrenCode;

    // Collect dynamic children class actions
    {
        private _action = [_x select 2, _x, _fullPath, _distanceToBasePoint] call FUNC(collectActiveActionTree);
        if (_action isNotEqualTo []) then {
            _activeChildren pushBack _action;
        };
    } forEach _dynamicChildren;
};

// Collect children class actions
{
    private _action = [_object, _x, _fullPath, _distanceToBasePoint] call FUNC(collectActiveActionTree);
    if (_action isNotEqualTo []) then {
        _activeChildren pushBack _action;
    };
} forEach _origActionChildren;

// Collect children object actions
{
    _x params ["_actionData", "_pPath"];

    // Check if the action is children of the original action
    if (_pPath isEqualTo _fullPath) then {
        private _action = [_object, [_actionData,[]], _fullPath, _distanceToBasePoint] call FUNC(collectActiveActionTree);
        if (_action isNotEqualTo []) then {
            _activeChildren pushBack _action;
        };
    };
} forEach GVAR(objectActionList);


// If the original action has no statement, and no children, don't display it
if ((_activeChildren isEqualTo []) && {_statementCode isEqualTo {}}) exitWith {
    // @todo: Account for showDisabled?
    []
};

if (GVAR(consolidateSingleChild) && {count _activeChildren == 1} && {_statementCode isEqualTo {}}) then {
    _activeChildren select 0 params ["_childActionData", "_childChildren", "_childObject"];
    _childActionData params ["", "_displayNameChild", "_iconChild", "_statementChild", "_conditionChild", "_insertChildrenChild", "_customParamsChild", "", "", "_paramsChild"];
    _origActionData = [
        _actionName,
        format ["%1 > %2", _displayName, _displayNameChild],
        _iconChild,
        _statementChild,
        _conditionChild,
        _insertChildrenChild,
        _customParamsChild,
        _position,
        _distance,
        _paramsChild
    ];
    _activeChildren = _childChildren;
    _object = _childObject;
};

[_origActionData, _activeChildren, _object]
