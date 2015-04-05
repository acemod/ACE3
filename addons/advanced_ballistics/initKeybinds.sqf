["ACE3", QGVAR(WindInfoKey), localize "STR_ACE_AdvancedBallistics_WindInfoKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(displayWindInfo);
    false
},
{false},
[37, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + K)

["ACE3", QGVAR(ProtractorKey), localize "STR_ACE_AdvancedBallistics_ProtractorKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(displayProtractor);
    false
},
{false},
[37, [true, true, false]], false, 0] call CBA_fnc_addKeybind; // (CTRL + SHIFT + K)
