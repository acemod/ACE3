#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Attempts to hold angle as fed to by seeker. Does so with a simple proportional controller
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_line
 *
 * Public: No
 */
// arbitrary constant
#define PROPORTIONALITY_CONSTANT 20
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos", "_targetData", "_navigationParams"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

_navigationParams params ["_yawChange", "_pitchChange", "_lastPitch", "_lastYaw", "_initialPitch", "_pitchUp", "_lastYawRateDifference"];

// for some reason we need to multiply this. I don't know why, but it just works
_pitchChange = _pitchChange * 1.5;
_yawChange = _yawChange * 1.5;

((velocity _projectile) call CBA_fnc_vect2polar) params ["", "_currentYaw", "_currentPitch"];

private _pitchRate = if (_timestep == 0) then {
    0
} else {
    (_currentPitch - _lastPitch) / _timestep
};
_navigationParams set [2, _currentPitch];

private _pitchModifier = if (_pitchChange == 0) then {
    1
} else {
    abs (_pitchRate / _pitchChange)
};
private _desiredPitchChange = (_pitchChange - _pitchRate) * PROPORTIONALITY_CONSTANT * _pitchModifier;
_desiredPitchChange = _desiredPitchChange + _pitchUp * (_initialPitch - _currentPitch) * PROPORTIONALITY_CONSTANT * _pitchModifier;

private _yawRate = if (_timestep == 0) then {
    0
} else {
    (_currentYaw - _lastYaw) / _timestep
};
_navigationParams set [3, _currentYaw];

private _yawRateDifference = _yawChange - _yawRate;
_navigationParams set [6, _yawRateDifference];

private _desiredYawChange = _yawRateDifference * PROPORTIONALITY_CONSTANT + _yawRateDifference * 2;

#ifdef DRAW_NLAW_INFO
private _yawModifier = if (_yawChange == 0) then {
    1
} else {
    abs (_yawRate / _yawChange)
};
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLToAGL getPosASLVisual _projectile, 0.75, 0.75, 0, format ["dP [%1] dY: [%2]", _desiredPitchChange, _desiredYawChange], 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], [0, 0, 1] vectorAdd ASLToAGL getPosASLVisual _projectile, 0.75, 0.75, 0, format ["pitch proportional [%1] yaw proportional [%2]", _pitchModifier, _yawModifier], 1, 0.025, "TahomaB"];
#endif

TRACE_4("nlaw pitch/yaw info",_currentPitch,_lastPitch,_currentYaw,_lastYaw);
TRACE_6("nlaw navigation",_yawChange,_desiredYawChange,_pitchChange,_desiredPitchChange,_yawRate,_pitchRate);

_projectile vectorModelToWorldVisual [_yawChange + _desiredYawChange, 0, _pitchChange + _desiredPitchChange]
