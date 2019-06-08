#include "script_component.hpp"

params ["_unit"];

if (_unit isEqualTo SPEED_MPH) exitWith {[LLSTRING(Speed_MPH), 1.609]};
if (_unit isEqualTo SPEED_KNOT) exitWith {[LLSTRING(Speed_KNOT), 1.852]};
if (_unit isEqualTo SPEED_MS) exitWith {[LLSTRING(Speed_MS), 3.6]};

[LLSTRING(Speed_KMH), 1]
