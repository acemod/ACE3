["ACE3 Equipment", QGVAR(KestrelDialogKey), localize "STR_ACE_Kestrel4500_KestrelDialogKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if(GVAR(Kestrel4500)) exitWith { false };
    
    // Statement
    [] call FUNC(createKestrelDialog);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)

["ACE3 Equipment", QGVAR(DisplayKestrelKey), localize "STR_ACE_Kestrel4500_DisplayKestrelKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(displayKestrel);
    false
},
{false},
[0, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)
