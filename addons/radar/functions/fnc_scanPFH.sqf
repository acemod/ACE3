/*
 * Author: BaerMitUmlaut
 * PFH emulating radar scanning.
 *
 * Arguments:
 * 0: PFH arguments
 * 1: PFH handle
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_args"];
_args params ["_vehicle", "_lastDir", "_lastTick", "_moveRight"];

private _angleH = _vehicle getVariable QGVAR(coneAngleH);
private _angleV = _vehicle getVariable QGVAR(coneAngleV);
_lastDir params ["_dirH", "_dirV"];

/*
    The radar scanning area is a cone with a rectangular
    base (imagine an infinite pyramid coming out of the
    nose of the aircraft). The radar beam itself now tries
    to cover the whole area of the pyramid by following an
    S shaped path (very similar to the rays of a CRT
    display).

    This means that a smaller horizontal or vertical angle
    of the scanning cone will result in the beam having to
    travel less and the scan becoming faster. The downside
    is of course that it covers a smaller area.

    To simulate this we divide the base of the pyramid into
    rectangular areas that the beam went through between
    now and the last call of the PFH. If we have an L
    shaped area, we simply complete it to a rectangle.
*/

// First check if the cone was changed and we're outside of the cone
if (_dirH > (_angleH / 2)) then {
    _dirH = _angleH / 2;
};
if (_dirV > (_angleV / 2)) then {
    _dirV = _angleV / 2;
};
if (_dirH < (_angleH / -2)) then {
    _dirH = _angleH / -2;
};
if (_dirV < (_angleV / -2)) then {
    _dirV = _angleV / -2;
};

// 24 movement steps per second (60 deg horizontal)
private _steps = 1 max round ((CBA_time - _lastTick) * 24);
private _newDirH = _dirH;
private _newDirV = _dirV;

while {_steps > 0} do {
    while {_steps > 0 && {_newDirH < _angleH}} do {
        // Beam has an angle of 2.5 deg
        _newDirH = [_newDirH + 2.5, _newDirH - 2.5] select _moveRight;
        _steps = _steps - 1;
    };

    // If we still have steps to take, switch direction, go one line lower
    if (_steps > 0) then {
        _moveRight = !_moveRight;
        _newDirV = _newDirV - 2.5;

        // If bottom of cone is reached, scan and back to the top.
        if (_newDirV < (_angleV / -2)) then {
            // scan here
            _newDirV = _angleV / 2;
        };
    };
};

// scan here
