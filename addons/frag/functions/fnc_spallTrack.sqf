//fnc_spallTrack.sqf
#include "script_component.hpp"

private ["_round", "_multiplier", "_foundObjects", "_foundObjectHPIds", "_delta", "_curPos", "_velocity", "_velocityStep", "_forwardPos", "_intersectsWith", "_index", "_hpId", "_data"];
_round = _this select 0;
_multiplier = _this select 1;
_foundObjects = _this select 2;
_foundObjectHPIds = _this select 3;

_delta = (1/diag_fps) * _multiplier;
_curPos = getPosASL _round;
_velocity = velocity _round;

_velocityStep = _velocity vectorMultiply _delta;
_forwardPos = _curPos vectorAdd _velocityStep;

_intersectsWith = lineIntersectsWith [_curPos, _forwardPos];

if (count _intersectsWith > 0) then {
    // player sideChat format["inter: %1", _intersectsWith];
    {
        if(!(_x in _foundObjects)) then {
            // diag_log text format["Adding HP: %1", _x];
            _index = (count GVAR(spallHPData));
            _hpId = _x addEventHandler ["hitPart", compile format["[%1, _this] call " + QFUNC(spallHP), _index]];
            _foundObjects set[(count _foundObjects), _x];
            _foundObjectHPIds set[(count _foundObjectHPIds), _hpId];
            _data = [_hpId, _x, typeOf _round, _round, _curPos, _velocity, 0, _foundObjects, _foundObjectHPIds];
            GVAR(spallHPData) set[_index, _data];
        };
    } forEach _intersectsWith;
};
