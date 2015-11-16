/*
 * Author: Ruthberg
 * Shows and starts the target speed assist timer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_target_speed_assist_timer
 *
 * Public: No
 */
#include "script_component.hpp"

if !(ctrlVisible 9000) then {

    false call FUNC(show_target_speed_assist);
    true call FUNC(show_target_speed_assist_timer);

    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 9002);

    [{
        private ["_args", "_startTime"];
        params ["_args","_idPFH"];
        _args params ["_startTime"];

        if (!(GVAR(speedAssistTimer))) exitWith {
            GVAR(speedAssistTimer) = true;

            ctrlSetText [8006, Str(Round((ACE_time - _startTime) * 10) / 10)];

            [] call FUNC(calculate_target_speed_assist);

            false call FUNC(show_target_speed_assist_timer);
            true call FUNC(show_target_speed_assist);

            [_idPFH] call cba_fnc_removePerFrameHandler;
        };

        ctrlSetText [9001, Str(Round((ACE_time - _startTime) * 10) / 10)];

    }, 0.1, [ACE_time]] call CBA_fnc_addPerFrameHandler;
};
