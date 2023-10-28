#define COMPONENT compat_cup_weapons
#define COMPONENT_BEAUTIFIED CUP Weapons Compatibility

#include "\z\ace\addons\main\script_mod.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

// Backwards compatibility
#undef GVAR
#define GVAR(var) TRIPLES(PREFIX,COMPONENT,var)
