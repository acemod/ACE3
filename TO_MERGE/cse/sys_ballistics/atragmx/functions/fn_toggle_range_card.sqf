#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

if (ctrlVisible 5006) then
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";
} else
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card.sqf";

	ctrlSetFocus (_dsp displayCtrl 5001);

	call cse_ab_ATragMX_fnc_calculate_range_card;
	call cse_ab_ATragMX_fnc_update_range_card;
};
