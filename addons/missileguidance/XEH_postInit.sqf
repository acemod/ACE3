#include "script_component.hpp"

[QGVAR(handoff), LINKFUNC(handleHandoff)] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), LLSTRING(CycleFireMode), {
    [] call FUNC(cycleAttackProfileKeyDown);
    false
}, {
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key


// Each MCLOS argument is the vector which acceleration will be applied
["ACE3 Weapons", QGVAR(mclosUp), LLSTRING(mclosUp), {
    [[0, 0, 1], ACE_player] call FUNC(mclosButtonPressed);
    false
}, {
    [[0, 0, -1], ACE_player] call FUNC(mclosButtonPressed);
},
[0x48, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 8

["ACE3 Weapons", QGVAR(mclosDown), LLSTRING(mclosDown), {
    [[0, 0, -1], ACE_player] call FUNC(mclosButtonPressed);
    false
}, {
    [[0, 0, 1], ACE_player] call FUNC(mclosButtonPressed);
},
[0x50, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 2

["ACE3 Weapons", QGVAR(mclosLeft), LLSTRING(mclosLeft), {
    [[1, 0, 0], ACE_player] call FUNC(mclosButtonPressed);
    false
}, {
    [[-1, 0, 0], ACE_player] call FUNC(mclosButtonPressed);
},
[0x4D, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 6

["ACE3 Weapons", QGVAR(mclosRight), LLSTRING(mclosRight), {
    [[-1, 0, 0], ACE_player] call FUNC(mclosButtonPressed);
    false
}, {
    [[1, 0, 0], ACE_player] call FUNC(mclosButtonPressed);
},
[0x4B, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 4
