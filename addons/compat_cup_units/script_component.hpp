#define COMPONENT compat_cup_units
#define COMPONENT_BEAUTIFIED CUP Units Compatibility

#include "\z\ace\addons\main\script_mod.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

// Backwards compatibility
#undef GVAR
#define GVAR(var) TRIPLES(PREFIX,COMPONENT,var)
