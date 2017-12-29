/*
 * Author: PabstMirror
 * Insert an ACE action to zeus.
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Parent path of the new action (e.g. ["ACE_ZeusActions"]) <ARRAY>
 * 1: Action <ARRAY>
 *
 * Return Value:
 * The entry full path, which can be used to add children entries <ARRAY>.
 *
 * Example:
 * [["ACE_ZeusActions"], zeusAction] call ace_interact_menu_fnc_addActionToZeus;
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!params [["_parentPath", [], [[]]], ["_action", [], [[]], 11]]) exitWith {ERROR("Bad Params"); []};
if ((_parentPath param [0, ""]) != "ACE_ZeusActions") exitWith {ERROR_1("Bad path %1 - should have ACE_ZeusActions as base", _parentPath); []};
TRACE_2("addActionToZeus",_parentPath,_action);

private _currentPath = GVAR(ZeusActions);
private _pathValid = false;
{
    private _targetParent = _x;
    _pathValid = false;
    {
        _x params ["_xAction", "_xSubActions"];
        TRACE_2("",_targetParent,_xAction);
        if ((_xAction select 0) == _targetParent) exitWith {
            _pathValid = true;
            _currentPath = _xSubActions;
        };
    } forEach _currentPath;
} forEach _parentPath;

if (!_pathValid) exitWith {ERROR_1("Bad path %1", _parentPath); []};

TRACE_1("Adding Action",_currentPath);
_currentPath pushBack [_action, []];

// Return the full path
(_parentPath + [_action select 0])
