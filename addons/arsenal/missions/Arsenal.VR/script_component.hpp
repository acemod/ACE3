#include "\z\ace\addons\arsenal\script_component.hpp"

// make.py can't redefine already defined macros
#undef PREP
#define PREP(var) FUNC(var) = compileFinal preprocessFileLineNumbers format ["fnc_%1.sqf", QUOTE(var)]
