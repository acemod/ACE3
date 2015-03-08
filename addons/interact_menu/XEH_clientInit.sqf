//XEH_clientInit.sqf
#include "script_component.hpp"

_fnc = {
	_this call FUNC(render);
};
addMissionEventHandler ["Draw3D", _fnc];

["ACE3", QGVAR(InteractKey), "Interact Key",
{_this call FUNC(keyDown)},
{_this call FUNC(keyUp)},
[219, [false, false, false]], false] call cba_fnc_addKeybind;  //Left Windows Key

["ACE3", QGVAR(SelfInteractKey), "Self Actions Key",
{_this call FUNC(keyDownSelfAction)},
{_this call FUNC(keyUpSelfAction)},
[219, [false, true, false]], false] call cba_fnc_addKeybind; //Left Windows Key + Ctrl/Strg
