#include "script_component.hpp"
/*
 * Author: Kingsley
 * Handles the chat command usage by admin.
 *
 * Arguments:
 * 0: Chat Text <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [""] call ace_fortify_fnc_handleChatCommand
 *
 * Public: No
 */

params ["_args"];
TRACE_1("handleChatCommand",_args);

_args = _args splitString " ";
if (_args isEqualTo []) exitWith {ERROR("Bad command");};
private _command = toLower (_args select 0);
_args deleteAt 0;

switch (_command) do {
    // Turns fortify mode on
    case "on": {
        missionNamespace setVariable [QGVAR(fortifyAllowed), true, true];
    };

    // Turns fortify mode off
    case "off": {
        missionNamespace setVariable [QGVAR(fortifyAllowed), false, true];
    };

    // Registers fortify presets for given side
    default {
        _args params [["_preset", "small"], ["_budget", "-1"]];

        private _side = [_command] call FUNC(parseSide);
        _budget = parseNumber _budget;

        private _objects = [_preset] call FUNC(getPlaceableSet);

        [QGVAR(registerObjects), [_side, _budget, _objects]] call CBA_fnc_serverEvent;
    };
};
