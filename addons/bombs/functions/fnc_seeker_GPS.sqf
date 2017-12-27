

#include "script_component.hpp"

params ["_projectile", "_seekerParams", "_seekerConfig"];
_seekerParams params ["", "", "_gpsTarget"];
_seekerConfig params ["_seekerAngle", "", "", ""];

private _vector = vectorDir _projectile;
private _targetVector = (getPosASL _projectile) vectorFromTo _gpsTarget;

private _foundTarget = if ((_vector vectorCos _targetVector) < (cos _seekerAngle)) then {
	_gpsTarget
} else {
	[0,0,0]
};

TRACE_1("",_foundTarget);
_foundTarget