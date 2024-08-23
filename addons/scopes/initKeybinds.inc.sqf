["ACE3 Scope Adjustment", QGVAR(AdjustUpMinor), LLSTRING(AdjustUpMinor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, ELEVATION_UP, MINOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [201, [false, false, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustDownMinor), LLSTRING(AdjustDownMinor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, ELEVATION_DOWN, MINOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [209, [false, false, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustLeftMinor), LLSTRING(AdjustLeftMinor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, WINDAGE_LEFT, MINOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [209, [false, true, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustRightMinor), LLSTRING(AdjustRightMinor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, WINDAGE_RIGHT, MINOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [201, [false, true, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustUpMajor), LLSTRING(AdjustUpMajor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, ELEVATION_UP, MAJOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [201, [true, false, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustDownMajor), LLSTRING(AdjustDownMajor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, ELEVATION_DOWN, MAJOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [209, [true, false, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustLeftMajor), LLSTRING(AdjustLeftMajor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, WINDAGE_LEFT, MAJOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [209, [true, true, false]], true] call CBA_fnc_addKeybind;

["ACE3 Scope Adjustment", QGVAR(AdjustRightMajor), LLSTRING(AdjustRightMajor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    [ACE_player] call FUNC(inventoryCheck);

    // Statement
    [ACE_player, WINDAGE_RIGHT, MAJOR_INCREMENT] call FUNC(adjustScope);
}, {false}, [201, [true, true, false]], true] call CBA_fnc_addKeybind;
