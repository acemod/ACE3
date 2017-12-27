#include "script_component.hpp"

params ["_projectile", "_seekerParams", "_seekerConfig"];
_seekerParams params ["", "_laserInfo", ""];
_seekerConfig params ["_seekerAngle", "", "_seekerMaxRange", ""];
_laserInfo params ["_laserCode", "_wavelengthMin", "_wavelengthMax"];

private _laserResult = [
    (getPosASL _projectile),
    (velocity _projectile),
    _seekerAngle,
    _seekerMaxRange,
    [_wavelengthMin, _wavelengthMax],
    _laserCode,
    _projectile
] call EFUNC(laser,seekerFindLaserSpot);

private _foundTargetPos = _laserResult select 0;
if !(_foundTargetPos isEqualType []) then {
    _foundTargetPos = [0,0,0];
};

TRACE_1("laser result", _laserResult);

_foundTargetPos