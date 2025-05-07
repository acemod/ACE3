// by commy2

["lock",
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
}] call EFUNC(missileguidance,keybind_add);
