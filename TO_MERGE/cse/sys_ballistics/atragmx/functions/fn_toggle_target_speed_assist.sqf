#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

if (ctrlVisible 8000) then
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";

	if (_this == 1) then
	{
		call cse_ab_ATragMX_fnc_calculate_target_speed_assist;
		ctrlSetText [330, Str(parseNumber(ctrlText 8007))];
	};
} else
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist.sqf";

	ctrlSetFocus (_dsp displayCtrl 8012);

	ctrlSetText [8004, Str(Round((cse_ab_ATragMX_targetRange select cse_ab_ATragMX_currentTarget)))];

	if (cse_ab_ATragMX_currentUnit != 2) then
	{
		ctrlSetText [8008, "Yards"];
	} else
	{
		ctrlSetText [8008, "Meters"];
	};

	if (cse_ab_ATragMX_currentUnit != 1) then
	{
		ctrlSetText [8011, "m/s"];
	} else
	{
		ctrlSetText [8011, "mph"];
	};
};
