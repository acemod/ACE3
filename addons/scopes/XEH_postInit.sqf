/*
 * Author: KoffeinFlummi and CAA-Picard
 *
 * Watches for scope changes.
 * Defines key bindings
 *
 */
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Check inventory when it changes
["playerInventoryChanged", {
    [ACE_player] call FUNC(inventoryCheck);
}] call EFUNC(common,addEventhandler);


// Instantly hide knobs when scoping in
["cameraViewChanged", {
    EXPLODE_2_PVT(_this,_player,_newCameraView);
    if (_newCameraView == "GUNNER") then {
        private "_layer";
        _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
        _layer cutText ["", "PLAIN", 0];


        if !(isNil QGVAR(fadePFH)) then {
            [GVAR(fadePFH)] call cba_fnc_removePerFrameHandler;
            GVAR(fadePFH) = nil;
        };
    };
}] call EFUNC(common,addEventhandler);


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
    localize "STR_ACE_Scopes_AdjustRight",
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
