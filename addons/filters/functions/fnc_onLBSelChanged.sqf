// by commy2
#include "script_component.hpp"

disableSerialization;
params ["_filter", "_index"];

GVAR(selectedFilterIndex) = _index;

[{
    disableSerialization;
    params ["_display"];

    [_display] call FUNC(forceItemListUpdate);
}, [ctrlParent _filter]] call EFUNC(common,execNextFrame);
