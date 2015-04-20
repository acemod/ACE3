#include "script_component.hpp"

if (time >= (_this select 0 select 0)) then
{
	ppEffectDestroy [_this select 0 select 1, _this select 0 select 2];
	[_this select 1] call CBA_fnc_removePerFrameHandler;
};