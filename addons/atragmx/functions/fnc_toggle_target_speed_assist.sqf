#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 8000) then
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
    
    if (_this == 1) then
    {
        [] call FUNC(calculate_target_speed_assist);
        ctrlSetText [330, Str(parseNumber(ctrlText 8007))];
    };
} else
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_target_speed_assist.sqf));
    
    ctrlSetFocus (_dsp displayCtrl 8012);
    
    ctrlSetText [8004, Str(Round((GVAR(ATragMX_targetRange) select GVAR(ATragMX_currentTarget))))];

    if (GVAR(ATragMX_currentUnit) != 2) then
    {
        ctrlSetText [8008, "Yards"];
    } else
    {
        ctrlSetText [8008, "Meters"];
    };
    
    if (GVAR(ATragMX_currentUnit) != 1) then
    {
        ctrlSetText [8011, "m/s"];
    } else
    {
        ctrlSetText [8011, "mph"];
    };
};
