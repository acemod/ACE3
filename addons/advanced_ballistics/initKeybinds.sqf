["ACE3 Equipment", QGVAR(ProtractorKey), localize "STR_ACE_AdvancedBallistics_ProtractorKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayProtractor);
},
{false},
[37, [true, true, false]], false, 0] call CBA_fnc_addKeybind; // (CTRL + SHIFT + K)
