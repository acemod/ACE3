#define COMPONENT compat_rhs_afrf3_usf3
#define COMPONENT_BEAUTIFIED RHS AFRF USAF Combined Compatibility

#include "\z\ace\addons\main\script_mod.hpp"

#include "\z\ace\addons\main\script_macros.hpp"

// Backwards compatibility
#undef GVAR
#define GVAR(var) TRIPLES(PREFIX,COMPONENT,var)
