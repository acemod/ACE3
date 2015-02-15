// by commy2

["ACE3",
    localize "STR_ACE_Vector_AzimuthKey",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"}) exitWith {false};

        // prevent holding down
        if (GETGVAR(isDownStateKey1,false)) exitWith {false};
        GVAR(isDownStateKey1) = true;

        // Statement
        ["azimuth"] call FUNC(onKeyDown);
        false
    },
    [15, [false, false, false]],
    false,
    "keydown"
] call CBA_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Vector_AzimuthKey",
    {
        // prevent holding down
        GVAR(isDownStateKey1) = false;

        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

        // Statement
        ["azimuth"] call FUNC(onKeyUp);
        false
    },
    [15, [false, false, false]],
    false,
    "keyup"
] call CBA_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Vector_DistanceKey",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"}) exitWith {false};

        // prevent holding down
        if (GETGVAR(isDownStateKey2,false)) exitWith {false};
        GVAR(isDownStateKey2) = true;

        // Statement
        ["distance"] call FUNC(onKeyDown);
        true
    },
    [19, [false, false, false]],
    false,
    "keydown"
] call CBA_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Vector_DistanceKey",
    {
        // prevent holding down
        GVAR(isDownStateKey2) = false;

        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

        // Statement
        ["distance"] call FUNC(onKeyUp);
        true
    },
    [19, [false, false, false]],
    false,
    "keyup"
] call CBA_fnc_registerKeybind;
