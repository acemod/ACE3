//fnc_spallTrack.sqf
#include "script_component.hpp"
private ["_params", "_round", "_multiplier", "_delta", "_curPos", "_velocity", "_velocityStep", "_forwardPos", "_intersectsWith", "_index", "_i", "_test", "_hpId", "_data"];
// setAccTime 0;
_round = _this select 0;
_multiplier = _this select 1;
_foundObjects = _this select 2;
_foundObjectHPIds = _this select 3;

_delta = (1/diag_fps)*_multiplier;
_curPos = getPosASL _round;
_velocity = velocity _round;

_velocityStep = [
				(_velocity select 0)*_delta,
				(_velocity select 1)*_delta,
				(_velocity select 2)*_delta
			];
_forwardPos = [
				(_curPos select 0) + (_velocityStep select 0),
				(_curPos select 1) + (_velocityStep select 1),
				(_curPos select 2) + (_velocityStep select 2)
			];
			
_intersectsWith = lineIntersectsWith [_curPos, _forwardPos];

if(count _intersectsWith > 0) then {
	// player sideChat format["inter: %1", _intersectsWith];
	{
		if(!(_x in _foundObjects)) then {
			// diag_log text format["Adding HP: %1", _x];
			_index = (count GVAR(spallHPData));
			_hpId = _x addEventHandler ["hitPart", format["[%1, _this] call " + QUOTE(FUNC(spallHP)), _index]];
			_foundObjects set[(count _foundObjects), _x];
			_foundObjectHPIds set[(count _foundObjectHPIds), _hpId];
			_data = [_hpId, _x, typeOf _round, _round, _curPos, _velocity, 0, _foundObjects, _foundObjectHPIds];
			GVAR(spallHPData) set[_index, _data];
		};
	} forEach _intersectsWith;
};