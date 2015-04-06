#include "script_component.hpp"

private ["_index"];
_index = 0 max (lbCurSel 6000);

GVAR(ATragMX_gunList) set [_index, +(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget))];

lbClear 6000;
{
	lbAdd [6000, _x select 0];
} forEach GVAR(ATragMX_gunList);

profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(ATragMX_gunList)];
