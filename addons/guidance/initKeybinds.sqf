["ACE3 Weapons", QGVAR(MFKey1), localize LSTRING(MFKey1),
{
    [1, true] call FUNC(keyDown);
},
{
    [1, false] call FUNC(keyDown);
},
[15, [false, false, false]], false] call CBA_fnc_addKeybind;  //Tab Key

["ACE3 Weapons", QGVAR(MFKey2), localize LSTRING(MFKey2),
{
    [2, true] call FUNC(keyDown);
},
{
    [2, false] call FUNC(keyDown);
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key

["ACE3 Weapons", QGVAR(MFKeyUp), localize LSTRING(MFKeyUp),
{
    [3, true] call FUNC(keyDown);
},
{
    [3, false] call FUNC(keyDown);
},
[200, [false, false, false]], false] call CBA_fnc_addKeybind;  //Up Arrow

["ACE3 Weapons", QGVAR(MFKeyLeft), localize LSTRING(MFKeyLeft),
{
    [4, true] call FUNC(keyDown);
},
{
    [4, false] call FUNC(keyDown);
},
[203, [false, false, false]], false] call CBA_fnc_addKeybind;  //Left

["ACE3 Weapons", QGVAR(MFKeyRight), localize LSTRING(MFKeyRight),
{
    [5, true] call FUNC(keyDown);
},
{
    [5, false] call FUNC(keyDown);
},
[205, [false, false, false]], false] call CBA_fnc_addKeybind;  //Right

["ACE3 Weapons", QGVAR(MFKeyDown), localize LSTRING(MFKeyDown),
{
    [6, true] call FUNC(keyDown);
},
{
    [6, false] call FUNC(keyDown);
},
[208, [false, false, false]], false] call CBA_fnc_addKeybind;  //Down

true;
