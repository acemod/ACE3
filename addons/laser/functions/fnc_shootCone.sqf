#include "script_component.hpp"

_divergence = 0.3;
_pos = _this select 0;
_vec = _this select 1;
_longestReturn = -1000000000;
_shortestReturn = 1000000000;
_resultPositions = [];
_p1 = [0,0,0];
_p2 = +_vec;
_p = (_vec call CBA_fnc_vect2polar);
_v = [(_p select 0), (_p select 1), (_p select 2)+90] call CBA_fnc_polar2vect;
_cp = [_vec, _v] call BIS_fnc_crossProduct;

_vecRotateMap = [_cp, _p1, _p2] call FUNC(rotateVectLineGetMap);

_result = [_pos, _vec] call FUNC(shootRay);
_resultPos = _result select 0;
if(!isNil "_resultPos") then {
	_distance = _result select 1;
	if(_distance < _shortestReturn) then {
		_shortestReturn = _distance;
	};
	if(_distance > _longestReturn) then {
		_longestReturn = _distance;
	};
	_resultPositions set[(count _resultPositions), _result];
#ifdef DEBUG_MODE_FULL
	DRAW_LINES set[(count DRAW_LINES), [_pos, _resultPos, [0, 1, 0, 1]]];
#endif
};
_count = 8;

_pos2 = [
			(_pos select 0)+((_vec select 0)*1000),
			(_pos select 1)+((_vec select 1)*1000),
			(_pos select 2)+((_vec select 2)*1000)
		];
{
	for "_i" from 0 to ceil(_count*_x) do {
		_radOffset = random 360;
		_offset = [_vecRotateMap, (((360/_count)*_i)+_radOffset) mod 360] call FUNC(rotateVectLine);
		_offsetPos = [
						(_pos2 select 0)+((_offset select 0)*(_divergence*_x)),
						(_pos2 select 1)+((_offset select 1)*(_divergence*_x)),
						(_pos2 select 2)+((_offset select 2)*(_divergence*_x))
					];
		_offsetVector = [_pos, _offsetPos] call BIS_fnc_vectorFromXtoY;
		_result = [_pos, _offsetVector] call FUNC(shootRay);
		_resultPos = _result select 0;
		if(!isNil "_resultPos") then {
			_distance = _result select 1;
			if(_distance < _shortestReturn) then {
				_shortestReturn = _distance;
			};
			if(_distance > _longestReturn) then {
				_longestReturn = _distance;
			};
			_resultPositions set[(count _resultPositions), _result];
#ifdef DEBUG_MODE_FULL
			DRAW_LINES set[(count DRAW_LINES), [_pos, _resultPos, [0, 1, 0, 1]]];
#endif
		};
	};
} forEach [1,0.5,0.25];
[_longestReturn, _shortestReturn, _resultPositions];