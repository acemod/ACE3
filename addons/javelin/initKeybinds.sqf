// by commy2

["ACE3 Weapons", QGVAR(lockTarget), localize LSTRING(LockTarget),
{
    if (GETGVAR(isLockKeyDown,false)) exitWith {false};

    GVAR(isLockKeyDown) = true;
    TRACE_1("lock key down",GVAR(isLockKeyDown));

    // Return false so it doesn't block the rest weapon action
    false
},
{
    // prevent holding down
    GVAR(isLockKeyDown) = false;
    TRACE_1("lock key up",GVAR(isLockKeyDown));

    false
},
[15, [false, false, false]], false] call CBA_fnc_addKeybind;  //Tab Key
