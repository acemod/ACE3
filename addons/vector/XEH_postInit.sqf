// by commy2
#include "script_component.hpp"

["ACE3",
    localize "STR_ACE_Vector_AzimuthKey",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"} && {!(GETGVAR(isDownStateKeyAzimuth,false))}) exitWith {false};

        GVAR(isDownStateKeyAzimuth) = true;

        // Statement
        ["azimuth"] call FUNC(onKeyDown);
        true
    },
    [15, [false, false, false]],
    false,
    "keydown"
] call CBA_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Vector_AzimuthKey",
    {
        GVAR(isDownStateKeyAzimuth) = false;

        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

        // Statement
        ["azimuth"] call FUNC(onKeyUp);
        true
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
        if !(currentWeapon ACE_player == "ACE_Vector" && {ACE_player == cameraOn} && {cameraView == "GUNNER"} && {!(GETGVAR(isDownStateKeyDistance,false))}) exitWith {false};

        GVAR(isDownStateKeyDistance) = true;

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
        GVAR(isDownStateKeyDistance) = false;

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
