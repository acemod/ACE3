/*
    Author:
    voiper
*/

#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

#define MOD QUOTE(ACE3 Spectator)
#define ESCAPE if (isNil QGVAR(cam)) exitWith {false}

/*
    Rationale for so many GVARs: In Keydown EHs, held keys have a ~0.5s pause before
    they start repeating, which is bad UX for camera movement; with these GVARs, a
    PFH (one in fnc_camera) immediately reacts to when their value changes, and starts
    repeating on the next frame.
*/

[MOD, QGVAR(keyNameCamMoveForward), localize LSTRING(keyCamMoveForward),
{
    ESCAPE;
    GVAR(keyCamMoveForward) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveForward) = false;
    false
},
[DIK_W, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamMoveBackward), localize LSTRING(keyCamMoveBackward),
{
    ESCAPE;
    GVAR(keyCamMoveBackward) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveBackward) = false;
    false
},
[DIK_S, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamMoveLeft), localize LSTRING(keyCamMoveLeft),
{
    ESCAPE;
    GVAR(keyCamMoveLeft) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveLeft) = false;
    false
},
[DIK_A, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamMoveRight), localize LSTRING(keyCamMoveRight),
{
    ESCAPE;
    GVAR(keyCamMoveRight) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveRight) = false;
    false
},
[DIK_D, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamMoveUp), localize LSTRING(keyCamMoveUp),
{
    ESCAPE;
    GVAR(keyCamMoveUp) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveUp) = false;
    false
},
[DIK_Q, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamMoveDown), localize LSTRING(keyCamMoveDown),
{
    ESCAPE;
    GVAR(keyCamMoveDown) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamMoveDown) = false;
    false
},
[DIK_Z, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotUp), localize LSTRING(keyCamRotUp),
{
    ESCAPE;
    GVAR(keyCamRotUp) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotUp) = false;
    false
},
[DIK_NUMPAD8, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotDown), localize LSTRING(keyCamRotDown),
{
    ESCAPE;
    GVAR(keyCamRotDown) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotDown) = false;
    false
},
[DIK_NUMPAD2, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotLeft), localize LSTRING(keyCamRotLeft),
{
    ESCAPE;
    GVAR(keyCamRotLeft) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotLeft) = false;
    false
},
[DIK_NUMPAD4, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotRight), localize LSTRING(keyCamRotRight),
{
    ESCAPE;
    GVAR(keyCamRotRight) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotRight) = false;
    false
},
[DIK_NUMPAD6, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotUpLeft), localize LSTRING(keyCamRotUpLeft),
{
    ESCAPE;
    GVAR(keyCamRotUpLeft) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotUpLeft) = false;
    false
},
[DIK_NUMPAD7, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotUpRight), localize LSTRING(keyCamRotUpRight),
{
    ESCAPE;
    GVAR(keyCamRotUpRight) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotUpRight) = false;
    false
},
[DIK_NUMPAD9, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotDownLeft), localize LSTRING(keyCamRotDownLeft),
{
    ESCAPE;
    GVAR(keyCamRotDownLeft) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotDownLeft) = false;
    false
},
[DIK_NUMPAD1, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotDownRight), localize LSTRING(keyCamRotDownRight),
{
    ESCAPE;
    GVAR(keyCamRotDownRight) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamRotDownRight) = false;
    false
},
[DIK_NUMPAD3, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamBankLeft), localize LSTRING(keyCamBankLeft),
{
    ESCAPE;
    GVAR(keyCamBankLeft) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamBankLeft) = false;
    false
},
[DIK_DIVIDE, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamBankRight), localize LSTRING(keyCamBankRight),
{
    ESCAPE;
    GVAR(keyCamBankRight) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamBankRight) = false;
    false
},
[DIK_MULTIPLY, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotMore), localize LSTRING(keyCamRotMore),
{
    ESCAPE;
    GVAR(keyCamRotMore) = true;
    //true to block default behaviour
    true
},
{
    ESCAPE;
    GVAR(keyCamRotMore) = false;
    false
},
[DIK_NUMPAD0, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamRotLess), localize LSTRING(keyCamRotLess),
{
    ESCAPE;
    GVAR(keyCamRotLess) = true;
    //true to block default behaviour
    true
},
{
    ESCAPE;
    GVAR(keyCamRotLess) = false;
    false
},
[DIK_DECIMAL, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamBankMod), localize LSTRING(keyCamBankMod),
{
    ESCAPE;
    GVAR(keyCamBankMod) = true;
    false
},
{
    ESCAPE;
    GVAR(keyCamBankMod) = false;
    false
},
[DIK_LSHIFT, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamReset), localize LSTRING(keyCamReset),
{
    ESCAPE;
    _cam = GVAR(cam);
    _dir = getDir _cam;
    if (!isNull GVAR(attach)) then {_dir = _dir - getDir GVAR(attach)};
    GVAR(vector) =  [_dir, 0, 0];
    [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
    GVAR(fov) = 0.7;
    _cam camPrepareFOV GVAR(fov);
    _cam camCommitPrepared 0;
    false
},
{
    false
},
[DIK_NUMPAD5, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamLock), localize LSTRING(keyCamLock),
{
    ESCAPE;
    if !GVAR(cameraOn) exitWith {};
    ["CameraMode", ["Lock"]] call FUNC(camera);
    false
},
{
    false
},
[DIK_SPACE, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCamAttach), localize LSTRING(keyCamAttach),
{
    ESCAPE;
    if !GVAR(cameraOn) exitWith {};
    ["CameraMode", ["Attach"]] call FUNC(camera);
    false
},
{
    false
},
[DIK_SPACE, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameUnitNext), localize LSTRING(keyUnitNext),
{
    ESCAPE;
    ["CameraMode", ["NewUnit", 1]] call FUNC(camera);
    false
},
{
    false
},
[DIK_RIGHT, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameUnitPrevious), localize LSTRING(keyUnitPrevious),
{
    ESCAPE;
    ["CameraMode", ["NewUnit", -1]] call FUNC(camera);
    false
},
{
    false
},
[DIK_LEFT, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNamePOVup), localize LSTRING(keyPOVup),
{
    ESCAPE;
    if (isNull GVAR(unit)) exitWith {};
    _lock = GVAR(lock) select 0;
    if (_lock > -1) then {["CameraMode", ["Lock"]] call FUNC(camera)};
    if (!isNull GVAR(attach)) then {
        ["CameraMode", ["Attach"]] call FUNC(camera);
    };
    if GVAR(cameraOn) then {
        ["CameraMode", ["Third"]] call FUNC(camera);
    } else {
        if GVAR(third) then {
            ["CameraMode", ["First"]] call FUNC(camera);
        };
    };
    false
},
{
    false
},
[DIK_UP, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNamePOVdown), localize LSTRING(keyPOVdown),
{
    ESCAPE;
    if (isNull GVAR(unit)) exitWith {};
    _lock = GVAR(lock) select 0;
    if (_lock > -1) then {["CameraMode", ["Lock"]] call FUNC(camera)};
    if (!isNull GVAR(attach)) then {
        ["CameraMode", ["Attach"]] call FUNC(camera);
    };
    if !GVAR(cameraOn) then {
        if !GVAR(third) then {
            ["CameraMode", ["Third"]] call FUNC(camera);
        } else {
            ["CameraMode", ["Free"]] call FUNC(camera);
        };
    };
    false
},
{
    false
},
[DIK_DOWN, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot1), localize LSTRING(keySaveSpot1),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 0]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F1, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot2), localize LSTRING(keySaveSpot2),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 1]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F2, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot3), localize LSTRING(keySaveSpot3),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 2]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F3, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot4), localize LSTRING(keySaveSpot4),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 3]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F4, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot5), localize LSTRING(keySaveSpot5),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 4]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F5, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot6), localize LSTRING(keySaveSpot6),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 5]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F6, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot7), localize LSTRING(keySaveSpot7),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 6]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F7, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot8), localize LSTRING(keySaveSpot8),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 7]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F8, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot9), localize LSTRING(keySaveSpot9),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 8]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F9, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot10), localize LSTRING(keySaveSpot10),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 9]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F10, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot11), localize LSTRING(keySaveSpot11),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 10]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F11, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveSpot12), localize LSTRING(keySaveSpot12),
{
    ESCAPE;
    ["CameraSlot", ["SaveSpot", 11]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F12, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot1), localize LSTRING(keyLoadSpot1),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 0]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F1, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot2), localize LSTRING(keyLoadSpot2),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 1]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F2, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot3), localize LSTRING(keyLoadSpot3),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 2]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F3, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot4), localize LSTRING(keyLoadSpot4),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 3]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F4, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot5), localize LSTRING(keyLoadSpot5),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 4]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F5, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot6), localize LSTRING(keyLoadSpot6),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 5]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F6, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot7), localize LSTRING(keyLoadSpot7),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 6]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F7, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot8), localize LSTRING(keyLoadSpot8),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 7]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F8, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot9), localize LSTRING(keyLoadSpot9),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 8]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F9, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot10), localize LSTRING(keyLoadSpot10),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 9]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F10, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot11), localize LSTRING(keyLoadSpot11),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 10]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F11, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadSpot12), localize LSTRING(keyLoadSpot12),
{
    ESCAPE;
    ["CameraSlot", ["LoadSpot", 11]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_F12, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit1), localize LSTRING(keySaveUnit1),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 0]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_1, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit2), localize LSTRING(keySaveUnit2),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 1]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_2, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit3), localize LSTRING(keySaveUnit3),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 2]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_3, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit4), localize LSTRING(keySaveUnit4),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 3]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_4, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit5), localize LSTRING(keySaveUnit5),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 4]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_5, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit6), localize LSTRING(keySaveUnit6),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 5]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_6, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit7), localize LSTRING(keySaveUnit7),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 6]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_7, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit8), localize LSTRING(keySaveUnit8),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 7]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_8, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit9), localize LSTRING(keySaveUnit9),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 8]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_9, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameSaveUnit10), localize LSTRING(keySaveUnit10),
{
    ESCAPE;
    ["CameraSlot", ["SaveUnit", 9]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_0, [false, true, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit1), localize LSTRING(keyLoadUnit1),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 0]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_1, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit2), localize LSTRING(keyLoadUnit2),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 1]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_2, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit3), localize LSTRING(keyLoadUnit3),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 2]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_3, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit4), localize LSTRING(keyLoadUnit4),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 3]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_4, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit5), localize LSTRING(keyLoadUnit5),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 4]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_5, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit6), localize LSTRING(keyLoadUnit6),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 5]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_6, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit7), localize LSTRING(keyLoadUnit7),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 6]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_7, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit8), localize LSTRING(keyLoadUnit8),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 7]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_8, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit9), localize LSTRING(keyLoadUnit9),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 8]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_9, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameLoadUnit10), localize LSTRING(keyLoadUnit10),
{
    ESCAPE;
    ["CameraSlot", ["LoadUnit", 9]] call FUNC(camera);
    //true to block default behaviour
    true
},
{
    false
},
[DIK_0, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFOVup), localize LSTRING(keyFOVup),
{
    ESCAPE;
    GVAR(keyFOVup) = true;
    false
},
{
    ESCAPE;
    GVAR(keyFOVup) = false;
    false
},
[DIK_ADD, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFOVdown), localize LSTRING(keyFOVdown),
{
    ESCAPE;
    GVAR(keyFOVdown) = true;
    false
},
{
    ESCAPE;
    GVAR(keyFOVdown) = false;
    false
},
[DIK_SUBTRACT, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFOVreset), localize LSTRING(keyFOVreset),
{
    ESCAPE;
    GVAR(fov) = 0.7;
    GVAR(cam) camPrepareFOV GVAR(fov);
    GVAR(cam) camCommitPrepared 0;
    //true to block default behaviour
    true
},
{
    false
},
[DIK_NUMPADENTER, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFocusUp), localize LSTRING(keyFocusUp),
{
    ESCAPE;
    GVAR(keyFocusUp) = true;
    false
},
{
    ESCAPE;
    GVAR(keyFocusUp) = false;
    false
},
[DIK_EQUALS, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFocusDown), localize LSTRING(keyFocusDown),
{
    ESCAPE;
    GVAR(keyFocusDown) = true;
    false
},
{
    ESCAPE;
    GVAR(keyFocusDown) = false;
    false
},
[DIK_MINUS, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFocusReset), localize LSTRING(keyFocusReset),
{
    ESCAPE;
    GVAR(focus) = [-1, 1];
    _cam camPrepareFocus GVAR(focus);
    _cam camCommitPrepared 0;
    false
},
{
    false
},
[DIK_BACKSPACE, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameFocusInfinite), localize LSTRING(keyFocusInfinite),
{
    ESCAPE;
    GVAR(focus) = [-1, -1];
    _cam camPrepareFocus GVAR(focus);
    _cam camCommitPrepared 0;
    //true to block default behaviour
    true
},
{
    false
},
[DIK_BACKSPACE, [true, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameTimeAccUp), localize LSTRING(keyTimeAccUp),
{
    ESCAPE;
    GVAR(keyTimeAccUp) = true;
    false
},
{
    ESCAPE;
    GVAR(keyTimeAccUp) = false;
    false
},
[DIK_RBRACKET, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameTimeAccDown), localize LSTRING(keyTimeAccDown),
{
    ESCAPE;
    GVAR(keyTimeAccDown) = true;
    false
},
{
    ESCAPE;
    GVAR(keyTimeAccDown) = false;
    false
},
[DIK_LBRACKET, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameTimeAccReset), localize LSTRING(keyTimeAccReset),
{
    ESCAPE;
    if (!isMultiplayer) then {
        GVAR(accTime) = 1;
        setAccTime GVAR(accTime);
    };
    false
},
{
    false
},
[DIK_BACKSLASH, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameToggleMarkers), localize LSTRING(keyToggleMarkers),
{
    ESCAPE;
    GVAR(markers) = GVAR(markers) + 1;
    if (GVAR(markers) > 3) then {GVAR(markers) = 0};
    if (GVAR(markers) == 0) then {clearRadio};
    false
},
{
    false
},
[DIK_T, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameUnitList), localize LSTRING(keyUnitList),
{
    ESCAPE;
    _map = uiNameSpace getVariable [QGVAR(map), findDisplay 12202];
    if (!isNull _map) exitWith {};

    _overlay = uiNamespace getVariable [QGVAR(overlay), findDisplay 12200];
    if (isNull _overlay) then {
        createDialog QGVAR(overlay);
    } else {
        closeDialog 0;
    };
    false
},
{
    false
},
[DIK_U, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameCrosshair), localize LSTRING(keyCrosshair),
{
    ESCAPE;
    _layer = [QGVAR(crosshair)] call BIS_fnc_rscLayer;
    _xhair = uiNamespace getVariable QGVAR(crosshair);
    if (isNull _xhair) then {
        _layer cutRsc [QGVAR(crosshair), "PLAIN", 0, true];
        call FUNC(crosshair);
    } else {
        _layer cutText ["", "PLAIN"];
    };
    false
},
{
    false
},
[DIK_X, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameStatus), localize LSTRING(keyStatus),
{
    ESCAPE;
    _layer = [QGVAR(compass)] call BIS_fnc_rscLayer;
    if (isNull (uiNamespace getVariable QGVAR(compass))) then {
        _layer cutRsc [QGVAR(compass), "PLAIN", 0, true];
    } else {
        _layer cutText ["", "PLAIN"];
    };

    _layer = [QGVAR(status)] call BIS_fnc_rscLayer;
    if (isNull (uiNamespace getVariable QGVAR(status))) then {
        _layer cutRsc [QGVAR(status), "PLAIN", 0, true];
    } else {
        _layer cutText ["", "PLAIN"];
    };
    false
},
{
    false
},
[DIK_C, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameMap), localize LSTRING(keyMap),
{
    ESCAPE;
    _map = uiNameSpace getVariable [QGVAR(map), findDisplay 12202];
    if (isNull _map) then {
        createDialog QGVAR(map);
    } else {
        closeDialog 0;
    };
    false
},
{
    false
},
[DIK_M, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;

[MOD, QGVAR(keyNameVision), localize LSTRING(keyVision),
{
    ESCAPE;
    GVAR(vision) = GVAR(vision) + 1;
    if (GVAR(vision) > 4) then {GVAR(vision) = 0};
    switch GVAR(vision) do {
        case 0: {
            camUseNVG false;
            false SetCamUseTi 0;
        };
        case 1: {
            camUseNVG true;
            false SetCamUseTi 0;
        };
        case 2: {
            camUseNVG false;
            true SetCamUseTi 0;
        };
        case 3: {
            camUseNVG false;
            true SetCamUseTi 1;
        };

        case 4: {
            camUseNVG false;
            true SetCamUseTi 4;
        };
    };
    false
},
{
    false
},
[DIK_N, [false, false, false]],
false,
0] call CBA_fnc_addKeybind;