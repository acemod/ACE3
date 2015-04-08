#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 7000) then
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_target_range_assist.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
    
    if (_this == 1) then
    {
        ctrlSetText [320, Str(parseNumber(ctrlText 7012))];
        ctrlSetText [340, Str(parseNumber(ctrlText 7013))];
    };
} else
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_target_range_assist.sqf));
    
    ctrlSetFocus (_dsp displayCtrl 7018);
    
    ctrlSetText [7012, Str(parseNumber(ctrlText 320))];
    ctrlSetText [7013, Str(parseNumber(ctrlText 340))];

    if (GVAR(currentUnit) != 2) then
    {
        ctrlSetText [7016, "Yards"];
    } else
    {
        ctrlSetText [7016, "Meters"];
    };
};
