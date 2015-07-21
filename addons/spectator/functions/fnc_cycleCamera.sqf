/*
 * Author: SilentSpike
 * Cycle through the spectator camera vision/view/units in steps
 *
 * Arguments:
 * 0: Camera mode steps <NUMBER>
 * 1: Camera unit steps <NUMBER>
 * 2: Vision mode steps <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0, -1] call ace_spectator_fnc_cycleCamera
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_stepMode",0], ["_stepUnit",0], ["_stepVision",0]];
private ["_modes","_visions","_iMode","_iVision","_countModes","_countVisions","_newMode","_newVision","_newUnit"];

_modes = GVAR(availableModes);
_visions = GVAR(availableVisions);

// Get current index
_iMode = abs(_modes find GVAR(camMode));
_iVision = abs(_visions find GVAR(camVision));

_countModes = count _modes;
_countVisions = count _visions;

// Step index by step number (lopp ends)
_iMode = (_iMode + _stepMode) % _countModes;
if (_iMode < 0) then { _iMode = _countModes + _iMode; };

_iVision = (_iVision + _stepVision) % _countVisions;
if (_iVision < 0) then { _iVision = _countVisions + _iVision; };

// Get value at new index
_newMode = _modes select _iMode;
_newVision = _visions select _iVision;

_newUnit = GVAR(camUnit);

[_newMode, _newUnit, _newVision] call FUNC(transitionCamera);
