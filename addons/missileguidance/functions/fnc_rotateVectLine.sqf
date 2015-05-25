#include "script_component.hpp"
private["_d", "_map", "_p", "_theta", "_u"];

_map = _this select 0;
_theta = _this select 1;

_p = _map select 0;
_p1 = _map select 1;
_p2 = _map select 2;

_q1 = +(_map select 3);
_q2 = +(_map select 4);
_u = _map select 5;
_d = _map select 6;

/* Step 4 */
_q2 set[0, (_q1 select 0) * cos(_theta) - (_q1 select 1) * sin(_theta)];
_q2 set[1, (_q1 select 0) * sin(_theta) + (_q1 select 1) * cos(_theta)];
_q2 set[2, (_q1 select 2)];

/* Inverse of step 3 */
_q1 set[0,   (_q2 select 0) * _d + (_q2 select 2) * (_u select 0)];
_q1 set[1,   (_q2 select 1)];
_q1 set[2, - (_q2 select 0) * (_u select 0) + (_q2 select 2) * _d];

/* Inverse of step 2 */
if (_d != 0) then {
  _q2 set[0,   (_q1 select 0)];
  _q2 set[1,   (_q1 select 1) * (_u select 2) / _d + (_q1 select 2) * (_u select 1) / _d];
  _q2 set[2, - (_q1 select 1) * (_u select 1) / _d + (_q1 select 2) * (_u select 2) / _d];
} else {
  _q2 = _q1;
};

/* Inverse of step 1 */
_q1 set[0, (_q2 select 0) + (_p1 select 0)];
_q1 set[1, (_q2 select 1) + (_p1 select 1)];
_q1 set[2, (_q2 select 2) + (_p1 select 2)];
_q1;