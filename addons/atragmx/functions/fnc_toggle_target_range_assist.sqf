#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 7000) then
{
	false call FUNC(show_target_range_assist);
	true call FUNC(show_main_page);
	
	if (_this == 1) then
	{
		ctrlSetText [320, Str(parseNumber(ctrlText 7012))];
		ctrlSetText [340, Str(parseNumber(ctrlText 7013))];
	};
} else
{
	false call FUNC(show_main_page);
	true call FUNC(show_target_range_assist);
	
	ctrlSetFocus (_dsp displayCtrl 7018);
	
	ctrlSetText [7012, Str(parseNumber(ctrlText 320))];
	ctrlSetText [7013, Str(parseNumber(ctrlText 340))];

	if (GVAR(ATragMX_currentUnit) != 2) then
	{
		ctrlSetText [7016, "Yards"];
	} else
	{
		ctrlSetText [7016, "Meters"];
	};
};
