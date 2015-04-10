#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if !(ctrlVisible 9000) then {

    false execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist_timer.sqf));

    ctrlSetFocus (_dsp displayCtrl 9002);
    
    [{
        private ["_args", "_startTime"];
        _args = _this select 0;
        _startTime = _args select 0;
        
        if (!(GVAR(speedAssistTimer))) exitWith {
            GVAR(speedAssistTimer) = true;
            
            ctrlSetText [8006, Str(Round((time - _startTime) * 10) / 10)];

            [] call FUNC(calculate_target_speed_assist);

            false execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist_timer.sqf));
            true execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist.sqf));
            
            [_this select 1] call cba_fnc_removePerFrameHandler;
        };
        
        ctrlSetText [9001, Str(Round((time - _startTime) * 10) / 10)];
        
    }, 0.1, [time]] call CBA_fnc_addPerFrameHandler;
};
