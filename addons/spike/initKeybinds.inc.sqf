["ACE3 Weapons", QGVAR(Designate), LLSTRING(Designate),
{
    [SPIKE_KEY_DESIGNATE, true] call FUNC(keyDown);
},
{
    [SPIKE_KEY_DESIGNATE, false] call FUNC(keyDown);
},
[15, [false, false, false]], false] call CBA_fnc_addKeybind;  // Tab

["ACE3 Weapons", QGVAR(LeaveCamera), LLSTRING(LeaveCamera),
{
    [SPIKE_KEY_LEAVE, true] call FUNC(keyDown);
},
{
    [SPIKE_KEY_LEAVE, false] call FUNC(keyDown);
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  // Ctrl+Tab

["ACE3 Weapons", QGVAR(PanUp), LLSTRING(PanUp),
{
    [CAMERA_KEY_UP, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_UP, false] call FUNC(keyDown);
},
[200, [false, false, false]], false] call CBA_fnc_addKeybind;  //Up Arrow

["ACE3 Weapons", QGVAR(PanLeft), LLSTRING(PanLeft),
{
    [CAMERA_KEY_LEFT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_LEFT, false] call FUNC(keyDown);
},
[203, [false, false, false]], false] call CBA_fnc_addKeybind;  //Left

["ACE3 Weapons", QGVAR(PanRight), LLSTRING(PanRight),
{
    [CAMERA_KEY_RIGHT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_RIGHT, false] call FUNC(keyDown);
},
[205, [false, false, false]], false] call CBA_fnc_addKeybind;  //Right

["ACE3 Weapons", QGVAR(PanDown), LLSTRING(PanDown),
{
    [CAMERA_KEY_DOWN, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_DOWN, false] call FUNC(keyDown);
},
[208, [false, false, false]], false] call CBA_fnc_addKeybind;  //Down

["ACE3 Weapons", QGVAR(CycleVisionMode), LLSTRING(Camera_ViewModeCycle),
{
    [CAMERA_KEY_CHANGE_VISION_MODE, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_CHANGE_VISION_MODE, false] call FUNC(keyDown);
},
[49, [false, false, false]], false] call CBA_fnc_addKeybind;  //N

["ACE3 Weapons", QGVAR(ZoomIn), LLSTRING(ZoomIn),
{
    [CAMERA_KEY_ZOOM_IN, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_ZOOM_IN, false] call FUNC(keyDown);
},
[78, [false, false, false]], false] call CBA_fnc_addKeybind;  //Keypad+

["ACE3 Weapons", QGVAR(ZoomOut), LLSTRING(ZoomOut),
{
    [CAMERA_KEY_ZOOM_OUT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_ZOOM_OUT, false] call FUNC(keyDown);
},
[74, [false, false, false]], false] call CBA_fnc_addKeybind;  //Keypad-
