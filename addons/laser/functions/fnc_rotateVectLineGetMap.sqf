#include "script_component.hpp"

private ["_p", "_theta", "_p1", "_p2", "_q1", "_q2", "_u", "_d"];
_p = _this select 0;
_p1 = _this select 1;
_p2 = _this select 2;

_q2 = [];

/* Step 1 */
_q1 = _p vectorDiff _p1;
_u = _p2 vectorDiff _p1;
_u = vectorNormalized _u;
_d = sqrt((_u select 1)*(_u select 1) + (_u select 2)*(_u select 2));

/* Step 2 */
if (_d != 0) then {
  _q2 set[0, (_q1 select 0)];
  _q2 set[1, (_q1 select 1) * (_u select 2) / _d - (_q1 select 2) * (_u select 1) / _d];
  _q2 set[2, (_q1 select 1) * (_u select 1) / _d + (_q1 select 2) * (_u select 2) / _d];
} else {
  _q2 = _q1;
};

/* Step 3 */
_q1 set[0, (_q2 select 0) * _d - (_q2 select 2) * (_u select 0)];
_q1 set[1, (_q2 select 1)];
_q1 set[2, (_q2 select 0) * (_u select 0) + (_q2 select 2) * _d];

[_p, _p1, _p2, _q1, _q2, _u, _d]