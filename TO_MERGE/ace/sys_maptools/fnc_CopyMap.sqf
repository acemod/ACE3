//copyMap.sqf
#include "script_component.hpp"
_target = _this;
if(GVAR(CopyTotal) == 0) then {
	[QGVAR(execcopy), [_target, player]] call ACE_fnc_receiverOnlyEvent;
};
