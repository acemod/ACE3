#include "script_component.hpp"
/*
 * Author: Seb
 * Shows a UI to allow a unit to change its group ID.
 *
 * Arguments:
 * 0: The unit renaming their group.
 *
 * Return Value:
 * None
 *
 * Example:
 * player spawn ace_interaction_fnc_renameGroupUI
 *
 * Public: No
 */

if !(canSuspend) exitWith {}; // createDisplay must be spawned
params [["_unit", objNull, [objNull]]];
private _display = findDisplay 46 createDisplay "ace_interaction_groupNameDisplay";
private _textCtrl = _display displayCtrl 451;
_textCtrl ctrlSetText (groupID group _unit);
_display setVariable [QGVAR(renamedGroup), group _unit];
_display displayAddEventHandler [
    "Unload", 
    {
        params ["_display", "_exitCode"];
        if !(_exitCode isEqualTo 1) exitWith {};
        private _group = _display getVariable QGVAR(renamedGroup);
        private _textCtrl = _display displayCtrl 451;
        private _newName = ctrlText _textCtrl;
        [_group, _newName] call FUNC(renameGroup);
    }
];