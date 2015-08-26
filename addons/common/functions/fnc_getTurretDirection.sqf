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
 * Public: No
 */
#include "script_component.hpp"

private ["_turret", "_povPos", "_povDir", "_gunBeginPos", "_gunEndPos", "_pov", "_gunBeg", "_gunEnd", "_pipDir"];

params ["_vehicle", "_position"];

_turret = [_vehicle, _position] call CBA_fnc_getTurret;
_pov = getText (_turret >> "memoryPointGunnerOptics");
_gunBeg = getText (_turret >> "gunBeg");
_gunEnd = getText (_turret >> "gunEnd");
TRACE_3("", _pov, _gunBeg, _gunEnd);

// Pull the PIP pov or barrel direction, depending on how the model is set up
_povPos = ATLtoASL ( _vehicle modelToWorldVisual (_vehicle selectionPosition _pov ) );
_povDir = [0,0,0];

if (_pov == "pip0_pos") then {
    _pipDir = ATLtoASL ( _vehicle modelToWorldVisual (_vehicle selectionPosition "pip0_dir" ) );
    _povDir = _pipDir vectorDiff _povPos;
} else {
    _gunBeginPos = ATLtoASL ( _vehicle modelToWorldVisual (_vehicle selectionPosition _gunBeg ) );
    _gunEndPos = ATLtoASL ( _vehicle modelToWorldVisual (_vehicle selectionPosition _gunEnd ) );
    _povDir = _gunBeginPos vectorDiff _gunEndPos;
};

[_povPos, _povDir]
