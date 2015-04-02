/*
 * Author: KoffeinFlummi and esteldunedain
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
["ACE3", QGVAR(AdjustUp), localize "STR_ACE_Scopes_AdjustUp",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    [ACE_player] call FUNC(inventoryCheck);
    if !([ACE_player, 0, 0.1] call FUNC(canAdjustScope)) exitWith {false};

    // Statement
    [ACE_player, 0, 0.1] call FUNC(adjustScope);
    true
},
{false},
[201, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3", QGVAR(AdjustDown), localize "STR_ACE_Scopes_AdjustDown",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    [ACE_player] call FUNC(inventoryCheck);
    if !([ACE_player, 0, -0.1] call FUNC(canAdjustScope)) exitWith {false};

    // Statement
    [ACE_player, 0, -0.1] call FUNC(adjustScope);
    true
},
{false},
[209, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3", QGVAR(AdjustLeft), localize "STR_ACE_Scopes_AdjustLeft",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    [ACE_player] call FUNC(inventoryCheck);
    if !([ACE_player, -0.1, 0] call FUNC(canAdjustScope)) exitWith {false};

    // Statement
    [ACE_player, -0.1, 0] call FUNC(adjustScope);
    true
},
{false},
[209, [false, true, false]], false] call cba_fnc_addKeybind;

["ACE3", QGVAR(AdjustRight), localize "STR_ACE_Scopes_AdjustRight",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    [ACE_player] call FUNC(inventoryCheck);
    if !([ACE_player, 0.1, 0] call FUNC(canAdjustScope)) exitWith {false};

    // Statement
    [ACE_player, 0.1, 0] call FUNC(adjustScope);
    true
},
{false},
[201, [false, true, false]], false] call cba_fnc_addKeybind;

// init shortdot
GVAR(showShortdot) = false;

["playerInventoryChanged", {
    if (_this select 1 isEqualTo []) exitWith {}; //@todo fix eh

    private "_showShortdot";
    _showShortdot = _this select 1 select 9 select 2 == "ACE_optic_DMS";

    if (GVAR(showShortdot)) then {
        if (!_showShortdot) then {
            // hide control and turn onDraw handler off
            (uiNamespace getVariable ["ACE_ctrlShortdotReticle", controlNull]) ctrlShow false;
            GVAR(showShortdot) = false;
        };
    } else {
        if (_showShortdot) then {
            // create control and turn onDraw handler on
            ([QGVAR(reticle)] call BIS_fnc_rscLayer) cutRsc ["ACE_Shortdot_Reticle", "PLAIN", 0, false];
            (uiNamespace getVariable "ACE_ctrlShortdotReticle") ctrlSetText QUOTE(PATHTOF(data\reticles\ace_shortdot_reticle_1.paa));
            GVAR(showShortdot) = true;
        };
    };
}] call EFUNC(common,addEventHandler);

addMissionEventHandler ["Draw3D", {if (GVAR(showShortdot)) then {call FUNC(onDrawShortdot)};}];
