#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 10000) then
{
    false call FUNC(show_range_card_setup);
    true call FUNC(show_range_card);
    
    if (_this == 1) then
    {
        GVAR(rangeCardStartRange) = 0 max Round(parseNumber(ctrlText 10003)) min 3000;
        GVAR(rangeCardEndRange) = 0 max Round(parseNumber(ctrlText 10004)) min 3000;
        GVAR(rangeCardIncrement) = 1 max Round(parseNumber(ctrlText 10005)) min 3000;
        
        [] call FUNC(calculate_range_card);
        [] call FUNC(update_range_card);
    };
} else
{
    false call FUNC(show_range_card);
    true call FUNC(show_range_card_setup);
    
    ctrlSetFocus (_dsp displayCtrl 10006);
    
    ctrlSetText [10003, Str(Round(GVAR(rangeCardStartRange)))];
    ctrlSetText [10004, Str(Round(GVAR(rangeCardEndRange)))];
    ctrlSetText [10005, Str(Round(GVAR(rangeCardIncrement)))];
};
