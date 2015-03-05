// by commy2

["ACE3", QGVAR(AzimuthKey), localize "STR_ACE_Vector_AzimuthKey",
{
    systemChat format ["Down %1", diag_tickTime];
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"}) exitWith {false};

    // Statement
    ["azimuth"] call FUNC(onKeyDown);
    true
},
{
    systemChat format ["Up %1", diag_tickTime];
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

    // Statement
    ["azimuth"] call FUNC(onKeyUp);
    true
},
[15, [false, false, false]], false, 0] call CBA_fnc_addKeybind; //Tab Key


["ACE3", QGVAR(DistanceKey), localize "STR_ACE_Vector_DistanceKey",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"}) exitWith {false};

    // Statement
    ["distance"] call FUNC(onKeyDown);
    true
},
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

    // Statement
    ["distance"] call FUNC(onKeyUp);
    true
},
[19, [false, false, false]], false] call CBA_fnc_registerKeybind; //R Key
