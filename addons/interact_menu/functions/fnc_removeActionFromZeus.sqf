#include "..\script_component.hpp"
/*
 * Author: Nomas / Redwan S.
 * Removes an action from Zeus
 *
 * Arguments:
 * 0: Full path of the action to remove <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["ACE_ZeusActions", "MyZeusAction"]] call ace_interact_menu_fnc_removeActionFromZeus;
 *
 * Public: No
 */

if (!hasInterface) exitWith {};
if (!params [["_fullPath", [], [[]]]]) exitWith {ERROR("Bad Params"); []};
if ((_fullPath param [0, ""]) != "ACE_ZeusActions") exitWith {ERROR_1("Bad path %1 - should have ACE_ZeusActions as base",_fullPath); []};
TRACE_1("removeActionFromZeus",_fullPath);

private _res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

private _currentPath = GVAR(ZeusActions);
private _pathValid = false;
{
    private _targetParent = _x;
    _pathValid = false;
    {
        _x params ["_xAction", "_xSubActions"];
        if ((_xAction select 0) == _targetParent) exitWith {
            _pathValid = true;
            _currentPath = _xSubActions;
        };
    } forEach _currentPath;
} forEach _parentPath;

if (!_pathValid) exitWith {ERROR_1("Bad path %1",_parentPath); []};

private _found = false;
{
    if (((_x select 0) select 0) == _actionName) exitWith {
        TRACE_2("Deleting Zeus Action",_forEachIndex,_x);
        _found = true;
        _currentPath deleteAt _forEachIndex;
    };
} forEach _currentPath;

if (!_found) then {
    WARNING("Failed to find action to delete");
}
