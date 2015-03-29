#include "script_component.hpp"

private ["_params", "_shell"];
_params = _this select 0;
_shell = _params select 0;
if(alive _shell) then {
	drop ["\Ca\Data\Cl_basic","","Billboard",1,30,(getPos _shell),[0,0,0],1,1.275,1.0,0.0,[0.5],[[0,1,0,1]],[0],0.0,2.0,"","",""];
} else {
	[_this select 1] call cba_fnc_removePerFrameHandler;
};