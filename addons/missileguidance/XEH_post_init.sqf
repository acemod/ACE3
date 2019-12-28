#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QGVAR(handoff), {_this call FUNC(handleHandoff)}] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), LLSTRING(CycleFireMode), {
    [] call FUNC(cycleAttackProfileKeyDown);
    false
}, {
    false
}, [DIK_TAB, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key

// MCLOS keybindings
["ACE3 Weapons", QGVAR(mclosUp), LLSTRING(MCLOS_Up), {
    [MCLOS_UP, true] call FUNC(mclosKeyhandler)
}, {
    [MCLOS_UP, false] call FUNC(mclosKeyhandler)
}, [DIK_W, [false, false, false]]] call CBA_fnc_addKeybind;
["ACE3 Weapons", QGVAR(mclosLeft), LLSTRING(MCLOS_Left), {
    [MCLOS_LEFT, true] call FUNC(mclosKeyhandler)
}, {
    [MCLOS_LEFT, false] call FUNC(mclosKeyhandler)
}, [DIK_A, [false, false, false]]] call CBA_fnc_addKeybind;
["ACE3 Weapons", QGVAR(mclosDown), LLSTRING(MCLOS_Down), {
    [MCLOS_DOWN, true] call FUNC(mclosKeyhandler)
}, {
    [MCLOS_DOWN, false] call FUNC(mclosKeyhandler)
}, [DIK_S, [false, false, false]]] call CBA_fnc_addKeybind;
["ACE3 Weapons", QGVAR(mclosRight), LLSTRING(MCLOS_Right), {
    [MCLOS_RIGHT, true] call FUNC(mclosKeyhandler)
}, {
    [MCLOS_RIGHT, false] call FUNC(mclosKeyhandler)
}, [DIK_D, [false, false, false]]] call CBA_fnc_addKeybind;
