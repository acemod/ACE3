#include "script_component.hpp"

params ["_unit"];

if (_unit isEqualTo SPEED_MPH) exitWith {[LLSTRING(Speed_MPH), KMH_TO_MPH]};
if (_unit isEqualTo SPEED_KNOT) exitWith {[LLSTRING(Speed_KNOT), KMH_TO_KNOT]};
if (_unit isEqualTo SPEED_MS) exitWith {[LLSTRING(Speed_MS), KMH_TO_MS]};

[LLSTRING(Speed_KMH), 1]
