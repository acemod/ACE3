#include "script_component.hpp"
/*
 * Author: ACE-Team
 *
 *
 * Argument:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_laser_fnc_rotateVectLine
 *
 * Public: No
 */

params ["_map", "_theta"];
_map params ["_p", "_p1", "_p2", "_q1", "_q2", "_u", "_d"];
_q1 = +_q1;
_q2 = +_q2;

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
_q1 = _q2 vectorAdd _p1;
_q1;
