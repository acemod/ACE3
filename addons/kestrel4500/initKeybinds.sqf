["ACE3", QGVAR(KestrelDialogKey), localize "STR_ACE_Kestrel4500_KestrelDialogKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(createKestrelDialog);
    false
},
{false},
[70, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (SCROLL)

["ACE3", QGVAR(DisplayKestrelKey), localize "STR_ACE_Kestrel4500_DisplayKestrelKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(displayKestrel);
    false
},
{false},
[70, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + SCROLL)
