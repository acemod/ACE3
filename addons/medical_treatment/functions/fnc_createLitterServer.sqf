#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Creates a litter object and handles its cleanup. Only execute on server.
 *
 * Arguments:
 * 0: Litter Class <STRING>
 * 1: Position ASL <ARRAY>
 * 2: Direction <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Litter_1", [100, 100, 0], 90] call ace_medical_fnc_createLitterServer
 *
 * Public: No
 */

params ["_litterClass", "_position", "_direction"];

if (isNil QGVAR(litterObjects)) then {
    GVAR(litterObjects) = [];
    GVAR(litterCleanup) = false;
};

private _model = getText (configFile >> "CfgVehicles" >> _litterClass >> "model");
if (_model == "") exitWith {};

// createSimpleObject expects a path without the leading slash
if (_model select [0, 1] == "\") then {
    _model = _model select [1];
};

private _object = createSimpleObject [_model, [0, 0, 0]];
_object setPosASL _position;
_object setDir _direction;

// Set the litter object's position next frame to correct HORRIBLE spacing (fixes #1112)
[{
    params ["_object", "_position"];
    _object setPosASL _position;
}, [_object, _position]] call CBA_fnc_execNextFrame;

// Delete oldest litter object if max count reached
if (count GVAR(litterObjects) > GVAR(maxLitterObjects)) then {
    private _litterToDelete = GVAR(litterObjects) deleteAt 0;
    deleteVehicle (_litterToDelete select 0);
};

GVAR(litterObjects) pushBack [_object, CBA_missionTime];

// Start cleanup loop if not already running and litter lifetime is not forever
if (!GVAR(litterCleanup) && {GVAR(litterCleanupDelay) > 0}) then {
    [] call FUNC(litterCleanupLoop);
    GVAR(litterCleanup) = true;
};
