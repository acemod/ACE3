#include "script_component.hpp"

private ["_index"];
_index = 0 max (lbCurSel 6000);

GVAR(gunList) set [_index, +(GVAR(workingMemory) select GVAR(currentTarget))];

lbClear 6000;
{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(gunList)];
