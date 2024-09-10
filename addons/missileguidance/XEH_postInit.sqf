#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[QGVAR(handoff), LINKFUNC(handleHandoff)] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), LLSTRING(CycleFireMode), {
    [] call FUNC(cycleAttackProfileKeyDown)
}, {
},
[DIK_TAB, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key


// Each MCLOS argument is the vector which acceleration will be applied
["ACE3 Weapons", QGVAR(mclosUp), LLSTRING(mclosUp), {
    [[0, 0, 1], ACE_player] call FUNC(MCLOS_buttonPressed)
}, {
    [[0, 0, -1], ACE_player] call FUNC(MCLOS_buttonPressed)
},
[DIK_NUMPAD8, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 8

["ACE3 Weapons", QGVAR(mclosDown), LLSTRING(mclosDown), {
    [[0, 0, -1], ACE_player] call FUNC(MCLOS_buttonPressed)
}, {
    [[0, 0, 1], ACE_player] call FUNC(MCLOS_buttonPressed)
},
[DIK_NUMPAD2, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 2

["ACE3 Weapons", QGVAR(mclosLeft), LLSTRING(mclosLeft), {
    [[1, 0, 0], ACE_player] call FUNC(MCLOS_buttonPressed)
}, {
    [[-1, 0, 0], ACE_player] call FUNC(MCLOS_buttonPressed)
},
[DIK_NUMPAD6, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 6

["ACE3 Weapons", QGVAR(mclosRight), LLSTRING(mclosRight), {
    [[-1, 0, 0], ACE_player] call FUNC(MCLOS_buttonPressed)
}, {
    [[1, 0, 0], ACE_player] call FUNC(MCLOS_buttonPressed)
},
[DIK_NUMPAD4, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 4
