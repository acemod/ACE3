//XEH_clientInit.sqf
#include "script_component.hpp"

_fnc = {
	_this call FUNC(render);
};
addMissionEventHandler ["Draw3D", _fnc];

["ACE3",
"Interact Key",
{_this call FUNC(keyDown)},
[219, [false, false, false]],
false,
"keydown"] call cba_fnc_registerKeybind;

["ACE3",
"Interact Key",
{_this call FUNC(keyUp)},
[219, [false, false, false]],
false,
"keyUp"] call cba_fnc_registerKeybind;

["ACE3",
"Self Actions Key",
{_this call FUNC(keyDownSelfAction)},
[219, [false, true, false]],
false,
"keydown"] call cba_fnc_registerKeybind;

["ACE3",
"Self Actions Key",
{_this call FUNC(keyUpSelfAction)},
[219, [false, true, false]],
false,
"keyUp"] call cba_fnc_registerKeybind;