#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if !(ctrlVisible 9000) then
{
	private ["_startTime"];
	
	false execVM "\atragmx\fnc_show_target_speed_assist.sqf";
	true execVM "\atragmx\fnc_show_target_speed_assist_timer.sqf";
	
	ctrlSetFocus (_dsp displayCtrl 9002);
	
	_startTime = time;
	
	while {GVAR(ATragMX_speedAssistTimer)} do
	{
		sleep 0.1;
		ctrlSetText [9001, Str(Round((time - _startTime) * 10) / 10)];
	};
	
	GVAR(ATragMX_speedAssistTimer) = true;
	
	ctrlSetText [8006, Str(Round((time - _startTime) * 10) / 10)];
	
	[] call FUNC(calculate_target_speed_assist);
	
	false execVM "\atragmx\fnc_show_target_speed_assist_timer.sqf";
	true execVM "\atragmx\fnc_show_target_speed_assist.sqf";
};
