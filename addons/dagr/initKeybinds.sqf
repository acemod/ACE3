
["ACE3 Equipment", QGVAR(MenuKey), "Configure DAGR",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {false};

    // Statement
    if (!GVAR(menuRun)) then {
        [] call FUNC(menuInit);
    } else {
        GVAR(PWR) = true; // Simulate pressing the power button
    };
    true
},
{false},
[199, [false, true, false]], false] call cba_fnc_addKeybind;  // (CTRL + Home)

["ACE3 Equipment", QGVAR(ToggleKey), "Toggle DAGR",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {false};

    // Statement
    [] call FUNC(toggleOverlay);
    true
},
{false},
[199, [false, false, false]], false] call cba_fnc_addKeybind;  // (Home)
