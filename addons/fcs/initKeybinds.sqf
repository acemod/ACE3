
["ACE3",
    localize "STR_ACE_FCS_LaseTarget",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(!GVAR(enabled) && {call FUNC(canUseRangefinder) || FUNC(canUseFCS)}) exitWith {false};

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
        if !(call FUNC(canUseRangefinder) || FUNC(canUseFCS)) exitWith {false};

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
        if !(call FUNC(canUseRangefinder) || FUNC(canUseFCS)) exitWith {false};

        // Statement
        [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -50] call FUNC(adjustRange);
        true
    },
    [209, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
