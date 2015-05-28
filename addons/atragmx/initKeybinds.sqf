["ACE3 Equipment", QGVAR(ATragMXDialogKey), localize LSTRING(ATragMXDialogKey),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {
        closeDialog 0;
        false
    };
    // Statement
    [] call FUNC(create_dialog);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)