#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

if (ctrlVisible 10000) then
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card_setup.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card.sqf";

	if (_this == 1) then
	{
		cse_ab_ATragMX_rangeCardStartRange = 0 max Round(parseNumber(ctrlText 10003)) min 3000;
		cse_ab_ATragMX_rangeCardEndRange = 0 max Round(parseNumber(ctrlText 10004)) min 3000;
		cse_ab_ATragMX_rangeCardIncrement = 1 max Round(parseNumber(ctrlText 10005)) min 3000;

		call cse_ab_ATragMX_fnc_calculate_range_card;
		call cse_ab_ATragMX_fnc_update_range_card;
	};
} else
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card_setup.sqf";

	ctrlSetFocus (_dsp displayCtrl 10006);

	ctrlSetText [10003, Str(Round(cse_ab_ATragMX_rangeCardStartRange))];
	ctrlSetText [10004, Str(Round(cse_ab_ATragMX_rangeCardEndRange))];
	ctrlSetText [10005, Str(Round(cse_ab_ATragMX_rangeCardIncrement))];
};
