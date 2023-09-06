#define COMPONENT compat_rhs_saf3
#define COMPONENT_BEAUTIFIED RHS SAF Compatibility

#include "\z\ace\addons\main\script_mod.hpp"

#include "\z\ace\addons\main\script_macros.hpp"

#define SUBCOMPONENT explosives
#undef ADDON
#define ADDON TRIPLES(PREFIX,COMPONENT,SUBCOMPONENT)
