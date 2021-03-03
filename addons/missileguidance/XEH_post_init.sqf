#include "script_component.hpp"

[QGVAR(handoff), {_this call FUNC(handleHandoff)}] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), localize LSTRING(CycleFireMode),
{
    [] call FUNC(cycleAttackProfileKeyDown);
    false
},
{
    false
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key

#ifdef DRAW_GUIDANCE_INFO
if (productVersion #4 == "Diag") then {
    call compile "'Shots' diag_enable false; [{'Shots' diag_enable true;}] call CBA_fnc_execNextFrame;";
};
#endif
