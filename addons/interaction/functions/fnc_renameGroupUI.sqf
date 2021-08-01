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
 * player call ace_interaction_fnc_renameGroupUI
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];
[
    LLSTRING(renameGroup),
    [
        [
            "EDIT",
            LLSTRING(renameGroupInput),
            [
                groupID  group _unit,
                {},
                5
            ],
            true
        ]
    ],
    {
        params ["_dialog_data", "_unit"]; 
        _dialog_data params ["_newName"]; 
        [group _unit, _newName] call FUNC(renameGroup);
    },
    {},
    _unit
] call zen_dialog_fnc_create
