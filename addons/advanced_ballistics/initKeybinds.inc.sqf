#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ACE3 Equipment", QGVAR(ProtractorKey), LLSTRING(ProtractorKey),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayProtractor) // return
},
{false},
[DIK_K, [true, true, false]], false, 0] call CBA_fnc_addKeybind; // (CTRL + SHIFT + K)
