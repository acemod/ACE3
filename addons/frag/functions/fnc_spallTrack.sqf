/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_spallTrack
 *
 * Public: No
 */

//fnc_spallTrack.sqf
#include "script_component.hpp"

params ["_round", "_multiplier", "_foundObjects", "_foundObjectHPIds"];

private _delta = (1 / diag_fps) * _multiplier;
private _curPos = getPosASL _round;
private _velocity = velocity _round;

private _velocityStep = _velocity vectorMultiply _delta;
private _forwardPos = _curPos vectorAdd _velocityStep;

private _intersectsWith = lineIntersectsWith [_curPos, _forwardPos];

if (_intersectsWith isEqualTo []) exitWith {};

// player sideChat format ["inter: %1", _intersectsWith];
{
    // diag_log text format ["Adding HP: %1", _x];
    private _index = count GVAR(spallHPData);
    private _hpId = _x addEventHandler ["hitPart", compile format ["[%1, _this] call " + QFUNC(spallHP), _index]];
    _foundObjects pushBack _x;
    _foundObjectHPIds pushBack _hpId;
    private _data = [_hpId, _x, typeOf _round, _round, _curPos, _velocity, 0, _foundObjects, _foundObjectHPIds];
    GVAR(spallHPData) pushBack _data;
} forEach (_intersectsWith select {!(_x in _foundObjects)});
