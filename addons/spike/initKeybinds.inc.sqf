#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ACE3 Weapons", QGVAR(Designate), LLSTRING(Designate),
{
    [SPIKE_KEY_DESIGNATE, true] call FUNC(keyDown);
},
{
    [SPIKE_KEY_DESIGNATE, false] call FUNC(keyDown);
},
[DIK_TAB, [false, false, false]], false] call CBA_fnc_addKeybind;  // Tab

["ACE3 Weapons", QGVAR(LeaveCamera), LLSTRING(LeaveCamera),
{
    [SPIKE_KEY_LEAVE, true] call FUNC(keyDown);
},
{
    [SPIKE_KEY_LEAVE, false] call FUNC(keyDown);
},
[DIK_TAB, [false, true, false]], false] call CBA_fnc_addKeybind;  // Ctrl+Tab

["up", {
    [CAMERA_KEY_UP, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_UP, false] call FUNC(keyDown);
}] call EFUNC(missileguidance,keybind_add);

["left", {
    [CAMERA_KEY_LEFT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_LEFT, false] call FUNC(keyDown);
}] call EFUNC(missileguidance,keybind_add);

["right", {
    [CAMERA_KEY_RIGHT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_RIGHT, false] call FUNC(keyDown);
}] call EFUNC(missileguidance,keybind_add);

["down", {
    [CAMERA_KEY_DOWN, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_DOWN, false] call FUNC(keyDown);
}] call EFUNC(missileguidance,keybind_add);

["ACE3 Weapons", QGVAR(CycleVisionMode), LLSTRING(Camera_ViewModeCycle),
{
    [CAMERA_KEY_CHANGE_VISION_MODE, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_CHANGE_VISION_MODE, false] call FUNC(keyDown);
},
[DIK_N, [false, false, false]], false] call CBA_fnc_addKeybind;  //N

["ACE3 Weapons", QGVAR(ZoomIn), LLSTRING(ZoomIn),
{
    [CAMERA_KEY_ZOOM_IN, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_ZOOM_IN, false] call FUNC(keyDown);
},
[DIK_ADD, [false, false, false]], false] call CBA_fnc_addKeybind;  //Keypad+

["ACE3 Weapons", QGVAR(ZoomOut), LLSTRING(ZoomOut),
{
    [CAMERA_KEY_ZOOM_OUT, true] call FUNC(keyDown);
},
{
    [CAMERA_KEY_ZOOM_OUT, false] call FUNC(keyDown);
},
[DIK_SUBTRACT, [false, false, false]], false] call CBA_fnc_addKeybind;  //Keypad-
