#include "script_component.hpp"
/*
 * Author: Seb
 * Shows a UI to allow a unit to change its group ID.
 *
 * Arguments:
 * 0: The unit renaming their group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_interaction_fnc_renameGroupUI
 *
 * Public: No
 */

// delay a frame so we don't overlap with interaction-menu as it closes
[{ 
    params [["_unit", objNull, [objNull]]];

    private _display = findDisplay 46 createDisplay QGVAR(groupNameDisplay);
    private _textCtrl = _display displayCtrl 451;
    _textCtrl ctrlSetText (groupID group _unit);
    _display setVariable [QGVAR(renamedGroup), group _unit];
    _display displayAddEventHandler ["Unload", {
        params ["_display", "_exitCode"];

        if !(_exitCode isEqualTo 1) exitWith {};
        
        private _group = _display getVariable QGVAR(renamedGroup);
        private _textCtrl = _display displayCtrl 451;
        private _newName = ctrlText _textCtrl;
        [_group, _newName] call FUNC(renameGroup);
    }];
}, _this] call CBA_fnc_execNextFrame;
