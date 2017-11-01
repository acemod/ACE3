/*
 * Author: esteldunedain, PabstMirror
 * Return a suitable position for the action point for the given target vehicle
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player's Position ASL <ARRAY>
 *
 * Return Value:
 * Interaction point in model cords <ARRAY>
 *
 * Example:
 * [cursorTarget, eyePos player] call ace_interaction_fnc_getVehiclePosComplex
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_cameraPosASL"];
TRACE_2("params",_target,_cameraPosASL);

private _bb = boundingBoxReal _target;
(_bb select 0) params ["_bbX", "_bbY", "_bbZ"];

private _config = configFile >> "CfgVehicles" >> (typeOf _target);
if (isNumber (_config >> QGVAR(bodyWidth))) then {_bbX = getNumber (_config >> QGVAR(bodyWidth));};
if (isNumber (_config >> QGVAR(bodyLength))) then {_bbY = getNumber (_config >> QGVAR(bodyLength));};

private _relPos = _target worldToModelVisual ASLToAGL _cameraPosASL;
_relPos params ["_dx", "_dy", "_dz"];

private _ndx = (abs _dx) / ((abs (_bbx)) - 1);
private _ndy = (abs _dy) / ((abs (_bbY)) - 1);
private _ndz = (abs _dz) / ((abs (_bbZ)) - 1);


private _pos = [];
if (_ndx > _ndy) then {
    if (_ndx > _ndz) then {
        // _ndx is greater, will colide with x plane first
        _pos = _relPos vectorMultiply ((1 / _ndx) min 0.8);
    } else {
        // _ndz is greater, will colide with z plane first
        _pos = _relPos vectorMultiply ((1 / _ndz) min 0.8);
    };
} else {
    if (_ndy > _ndz) then {
        // _ndy is greater, will colide with y plane first
        _pos = _relPos vectorMultiply ((1 / _ndy) min 0.8);
    } else {
        // _ndz is greater, will colide with z plane first
        _pos = _relPos vectorMultiply ((1 / _ndz) min 0.8);
    };
};

// Set max height at player's eye level (prevent very high interaction point on vehicles)
// Only when above water level to prevent underwater actions from following player eye level
if (_cameraPosASL select 2 >= 0) then {
    _pos set [2, (_pos select 2) min _dz];
};

TRACE_4("",_bb,_bbX,_relPos,_pos,_cameraPosASL);
_pos
