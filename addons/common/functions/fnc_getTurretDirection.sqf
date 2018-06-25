#include "script_component.hpp"
/*
 * Author: jaynus
 * Get the absolute turret direction for FOV/PIP turret.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Position <ARRAY>
 *
 * Return Value:
 * 0: Position ASL <ARRAY>
 * 1: Direction <ARRAY>
 *
 * Example:
 * [car, [5,6,5]] call ace_common_fnc_getTurretDirection
 *
 * Public: Yes
 */

params ["_vehicle", "_position"];

private _turret = [_vehicle, _position] call CBA_fnc_getTurret;

private _pov = getText (_turret >> "memoryPointGunnerOptics");
private _gunBeg = getText (_turret >> "gunBeg");
private _gunEnd = getText (_turret >> "gunEnd");

TRACE_3("", _pov, _gunBeg, _gunEnd);

// Pull the PIP pov or barrel direction, depending on how the model is set up
private _povPos = ATLtoASL (_vehicle modelToWorldVisual (_vehicle selectionPosition _pov)); //@todo AGLToASL ?
private _povDir = [0,0,0];

if (_pov == "pip0_pos") then {
    private _pipDir = ATLtoASL (_vehicle modelToWorldVisual (_vehicle selectionPosition "pip0_dir"));

    _povDir = _pipDir vectorDiff _povPos;
} else {
    private _gunBeginPos = ATLtoASL (_vehicle modelToWorldVisual (_vehicle selectionPosition _gunBeg));
    private _gunEndPos = ATLtoASL (_vehicle modelToWorldVisual (_vehicle selectionPosition _gunEnd));

    _povDir = _gunBeginPos vectorDiff _gunEndPos;
};
_povDir = vectorNormalized _povDir;
[_povPos, _povDir]
