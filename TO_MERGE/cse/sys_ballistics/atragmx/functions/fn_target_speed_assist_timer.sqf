#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

if !(ctrlVisible 9000) then
{
	private ["_startTime"];

	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist_timer.sqf";

	ctrlSetFocus (_dsp displayCtrl 9002);

	_startTime = time;

	while {cse_ab_ATragMX_speedAssistTimer} do
	{
		sleep 0.1;
		ctrlSetText [9001, Str(Round((time - _startTime) * 10) / 10)];
	};

	cse_ab_ATragMX_speedAssistTimer = true;

	ctrlSetText [8006, Str(Round((time - _startTime) * 10) / 10)];

	call cse_ab_ATragMX_fnc_calculate_target_speed_assist;

	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist_timer.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist.sqf";
};
