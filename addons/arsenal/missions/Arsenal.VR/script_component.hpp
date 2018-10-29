#include "\z\ace\addons\arsenal\script_component.hpp"

#undef PREP // make.py can't redefine already defined macros
#define PREP(var) FUNC(var) = compileFinal preprocessFileLineNumbers format ["fnc_%1.sqf", QUOTE(var)]
