#include "script_component.hpp"

if (isServer) then {
    // Cancel deploy on hard disconnection. Function is identical to interrupted
    addMissionEventHandler ["HandleDisconnect", {(_this select 0) call FUNC(handleDeployInterrupt)}];
};

if (!hasInterface) exitWith {};

GVAR(deployPFH) = -1;
GVAR(deployDistance) = -1;
GVAR(deployDirection) = 0;
GVAR(deployHeight) = 0;

// Cancel object deployment if interact menu opened
["ace_interactMenuOpened", {ACE_player call FUNC(handleDeployInterrupt)}] call CBA_fnc_addEventHandler;

// Cancel deploy on player change. This does work when returning to lobby, but not when hard disconnecting
["unit", LINKFUNC(handleDeployInterrupt)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {(_this select 0) call FUNC(handleDeployInterrupt)}] call CBA_fnc_addPlayerEventHandler;
["weapon", {(_this select 0) call FUNC(handleDeployInterrupt)}] call CBA_fnc_addPlayerEventHandler;
["loadout", {[_this select 0, objNull, false] call FUNC(handleDeployInterrupt)}] call CBA_fnc_addPlayerEventHandler;

// When changing feature cameras, stop deployment
["featureCamera", {(_this select 0) call FUNC(handleDeployInterrupt)}] call CBA_fnc_addPlayerEventHandler;

// Handle death
[QGVAR(killedEH), "Killed", {(_this select 0) call FUNC(handleDeployInterrupt)}] call CBA_fnc_addBISPlayerEventHandler;

// Handle falling unconscious while trying to deploy
["ace_unconscious", {
    params ["_unit", "_isUnconscious"];

    // Since global event, let clients handle local objects themselves
    if !(_isUnconscious && {local _unit}) exitWith {};

    _unit call FUNC(handleDeployInterrupt);
}] call CBA_fnc_addEventHandler;

// Handle surrendering and handcuffing
["ace_captiveStatusChanged", {
    params ["_unit", "_state"];

    // If surrendered or handcuffed, stop deployment; Since global event, let clients handle local objects themselves
    if !(_state && {local _unit}) exitWith {};

    _unit call FUNC(handleDeployInterrupt);
}] call CBA_fnc_addEventHandler;

if (["ace_dragging"] call EFUNC(common,isModLoaded)) then {
    // When carrying starts, update surrounding sandbags
    [QEGVAR(dragging,setupCarry), {
        params ["", "_target"];

        if !(_target isKindOf "ACE_SandbagObject") exitWith {};

        // Force PhysX update
        {
            [QEGVAR(common,awake), [_x, true]] call CBA_fnc_globalEvent;
        } forEach ((_target nearObjects ["ACE_SandbagObject", 5]) - [_target]);
    }] call CBA_fnc_addEventHandler;

    // When carrying stops, update surrounding sandbags
    [QEGVAR(dragging,stoppedCarry), {
        params ["", "_target", "_loadCargo"];

        if (_loadCargo || {!(_target isKindOf "ACE_SandbagObject")}) exitWith {};

        // Force PhysX update
        {
            [QEGVAR(common,awake), [_x, true]] call CBA_fnc_globalEvent;
        } forEach ((_target nearObjects ["ACE_SandbagObject", 5]) - [_target]);
    }] call CBA_fnc_addEventHandler;
};
