/*
 * Author: jaynus
 *
 * Get the absolute turret direction for FOV/PIP turret.
 *
 * Argument:
 * 0: Vehicle (Object)
 * 1: Turret Position
 *
 * Return value:
 * [position, direction]
 */
#include "script_component.hpp"

PARAMS_2(_vehicle,_position);
private ["_turrets", "_turret", "_config", "_turret", "_povPos", "_povDir", "_gunBeginPos", "_gunEndPos", "_pov", "_gunBeg", "_gunEnd", "_pipDir"];

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