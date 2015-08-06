// by commy2

["localize ELSTRING(common,ACEConfigCategoryVehicles)", QGVAR(lazeTarget), localize LSTRING(LaseTarget),
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

    if (GETGVAR(isDownStateKey1,false)) exitWith {false};
    GVAR(isDownStateKey1) = true;

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyDown);
    // Return false so it doesn't block the rest weapon action
    false
},
{
    // prevent holding down
    GVAR(isDownStateKey1) = false;

    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(GVAR(enabled) && FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyUp);
    false
},
[15, [false, false, false]], false] call cba_fnc_addKeybind;  //Tab Key

["localize ELSTRING(common,ACEConfigCategoryVehicles)", QGVAR(adjustRangeUp), localize LSTRING(AdjustRangeUp),
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(call FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), 50] call FUNC(adjustRange);
    true
},
{false},
[201, [false, false, false]], false] call cba_fnc_addKeybind;  //PageUp Key

["localize ELSTRING(common,ACEConfigCategoryVehicles)", QGVAR(adjustRangDown), localize LSTRING(AdjustRangeDown),
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(call FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -50] call FUNC(adjustRange);
    true
},
{false},
[209, [false, false, false]], false] call cba_fnc_addKeybind; //PageDown Key
