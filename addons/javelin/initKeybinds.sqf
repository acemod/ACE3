// by commy2

["ACE3 Weapons", QGVAR(lockTarget), localize "STR_ACE_JAVELIN_LockTarget",
{
    if (GETGVAR(isLockKeyDown,false)) exitWith {false};

    GVAR(isLockKeyDown) = true;

    // Statement
    [ACE_player] call FUNC(lockKeyDown);
    // Return false so it doesn't block the rest weapon action
    false
},
{
    // prevent holding down
    GVAR(isLockKeyDown) = false;

    // Statement
    [ACE_player] call FUNC(lockKeyUp);
    false
},
[15, [false, false, false]], false] call cba_fnc_addKeybind;  //Tab Key

["ACE3 Weapons", QGVAR(cycleFireMode), localize "STR_ACE_JAVELIN_CycleFireMode",
{ false },
{
    [ACE_player] call FUNC(cycleFireMode);
    false
},
[15, [false, true, false]], false] call cba_fnc_addKeybind;  //Ctrl+Tab Key