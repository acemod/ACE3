#define COMPONENT compat_rhs_usf3
#define COMPONENT_BEAUTIFIED RHS USAF Compatibility

#include "\z\ace\addons\main\script_mod.hpp"

#include "\z\ace\addons\main\script_macros.hpp"

// Backwards compatibility
#undef GVAR
#define GVAR(var) TRIPLES(PREFIX,COMPONENT,var)
