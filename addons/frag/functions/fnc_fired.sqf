#include "script_component.hpp"
params ["_gun", "", "", "", "_type", "", "_round"];

[_gun, _type, _round] call FUNC(addPfhRound);
