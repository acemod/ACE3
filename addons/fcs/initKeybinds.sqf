// by commy2

["ACE3",
    localize "STR_ACE_FCS_LaseTarget",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

        // prevent holding down
        if (GETGVAR(isDownStateKey1,false)) exitWith {false};
        GVAR(isDownStateKey1) = true;

        // Statement
        [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyDown);
        // Return false so it doesn't block the rest weapon action
        false
    },
    [15, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_FCS_LaseTarget",
    {
        // prevent holding down
        GVAR(isDownStateKey1) = false;

        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(GVAR(enabled) && FUNC(canUseFCS)) exitWith {false};

        // Statement
        [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyUp);
        false
    },
    [15, [false, false, false]],
    false,
    "keyup"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_FCS_AdjustRangeUp",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(FUNC(canUseFCS)) exitWith {false};

        // Statement
        [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), 50] call FUNC(adjustRange);
        true
    },
    [201, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_FCS_AdjustRangeDown",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(FUNC(canUseFCS)) exitWith {false};

        // Statement
        [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -50] call FUNC(adjustRange);
        true
    },
    [209, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
