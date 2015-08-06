[localize ELSTRING(common,ACEConfigCategoryEquipment), QGVAR(ProtractorKey), localize LSTRING(ProtractorKey),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayProtractor);
},
{false},
[37, [true, true, false]], false, 0] call CBA_fnc_addKeybind; // (CTRL + SHIFT + K)
