#include "script_component.hpp"

params ["_unit"];

if (_unit isEqualTo ALT_F) exitWith {["f", METERS_TO_FEET]};

["m", 1]
