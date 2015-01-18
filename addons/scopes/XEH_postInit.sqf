/*
 * Author: KoffeinFlummi and CAA-Picard
 *
 * Watches for scope changes.
 * Defines key bindings
 *
 */
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// show overlay after changing weapon/optic
0 spawn {
    _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
    while {True} do {
        waitUntil {[ACE_player, 0,0] call FUNC(canAdjustScope)};
        _layer cutRsc [QGVAR(Zeroing), "PLAIN", 0, false];
        sleep 3;
        _layer cutFadeOut 2;

        _weapon = currentWeapon ACE_player;
        _optics = [ACE_player] call FUNC(getOptics);
        waitUntil {sleep 0.05; !(_optics isEqualTo ([ACE_player] call FUNC(getOptics))) or (currentWeapon ACE_player != _weapon)};
    };
};

// instantly hide when scoping in
0 spawn {
    _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
    while {True} do {
    waitUntil {sleep 0.05; cameraView == "GUNNER"};
    if !(isNull GVAR(fadeScript)) then {
        terminate GVAR(fadeScript);
    };
        _layer cutText ["", "PLAIN", 0];
    };
};


// Add keybinds
["ACE3",
    localize "STR_ACE_Scopes_AdjustUp",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        [ACE_player] call FUNC(inventoryCheck);
        if !([ACE_player, 0, 0.1] call FUNC(canAdjustScope)) exitWith {false};

        // Statement
        [ACE_player, 0, 0.1] call FUNC(adjustScope);
        true
    },
    [201, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Scopes_AdjustDown",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        [ACE_player] call FUNC(inventoryCheck);
        if !([ACE_player, 0, -0.1] call FUNC(canAdjustScope)) exitWith {false};

        // Statement
        [ACE_player, 0, -0.1] call FUNC(adjustScope);
        true
    },
    [209, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_Scopes_AdjustLeft",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        [ACE_player] call FUNC(inventoryCheck);
        if !([ACE_player, -0.1, 0] call FUNC(canAdjustScope)) exitWith {false};

        // Statement
        [ACE_player, -0.1, 0] call FUNC(adjustScope);
        true
    },
    [209, [false, true, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "adjustScopeRight",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        [ACE_player] call FUNC(inventoryCheck);
        if !([ACE_player, 0.1, 0] call FUNC(canAdjustScope)) exitWith {false};

        // Statement
        [ACE_player, 0.1, 0] call FUNC(adjustScope);
        true
    },
    [201, [false, true, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
