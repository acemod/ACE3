#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 10000) then
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_range_card_setup.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_range_card.sqf));
    
    if (_this == 1) then
    {
        GVAR(ATragMX_rangeCardStartRange) = 0 max Round(parseNumber(ctrlText 10003)) min 3000;
        GVAR(ATragMX_rangeCardEndRange) = 0 max Round(parseNumber(ctrlText 10004)) min 3000;
        GVAR(ATragMX_rangeCardIncrement) = 1 max Round(parseNumber(ctrlText 10005)) min 3000;
        
        [] call FUNC(calculate_range_card);
        [] call FUNC(update_range_card);
    };
} else
{
    false execVM QUOTE(PATHTOF(functions\fnc_show_range_card.sqf));
    true execVM QUOTE(PATHTOF(functions\fnc_show_range_card_setup.sqf));
    
    ctrlSetFocus (_dsp displayCtrl 10006);
    
    ctrlSetText [10003, Str(Round(GVAR(ATragMX_rangeCardStartRange)))];
    ctrlSetText [10004, Str(Round(GVAR(ATragMX_rangeCardEndRange)))];
    ctrlSetText [10005, Str(Round(GVAR(ATragMX_rangeCardIncrement)))];
};
