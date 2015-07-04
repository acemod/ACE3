/*
    Author:
    voiper

    Description:
    Orient and set compass.

    Arguments:
    0: Compass <Display>

    Example:
    [display] call ace_spectator_fnc_compass;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

#define RESUNITS_X safeZoneW / 100
#define CENTRE safeZoneX + safeZoneW / 2
#define COMPASS_W RESUNITS_X * 20
#define COMPASS_X CENTRE - COMPASS_W / 2
#define ARC_W COMPASS_W / 2
#define DEGUNIT COMPASS_W / 180

_dialog = _this select 0;

_Q1 = _dialog displayCtrl 1;
_Q2 = _dialog displayCtrl 2;
_Q3 = _dialog displayCtrl 3;
_Q4 = _dialog displayCtrl 4;
_qOrder = [];

_dir = if GVAR(cameraOn) then {getDir GVAR(cam)} else {getDir GVAR(unit)};
_angleFromCentre = _dir - floor(_dir / 90) * 90;
_leftEdgePos = _angleFromCentre * DEGUNIT;

_positions = [
    [CENTRE - _leftEdgePos - ARC_W, safeZoneY],
    [CENTRE - _leftEdgePos, safeZoneY],
    [CENTRE - _leftEdgePos + ARC_W, safeZoneY],
    [0, safeZoneY - 1]
];

_qOrder = switch (true) do {
    case ((_dir >= 0) && (_dir < 90)): {[_Q4, _Q1, _Q2, _Q3]};
    case ((_dir >= 90) && (_dir < 180)): {[_Q1, _Q2, _Q3, _Q4]};
    case ((_dir >= 180) && (_dir < 270)): {[_Q2, _Q3, _Q4, _Q1]};
    case (_dir >= 270): {[_Q3, _Q4, _Q1, _Q2]};
};

{
    _x ctrlSetPosition (_positions select _forEachIndex);
    _x ctrlCommit 0;
} forEach _qOrder;
