#define COMPONENT compat_rhs_usf3
#define COMPONENT_BEAUTIFIED RHS USAF Compatibility

#include "\z\ace\addons\main\script_mod.hpp"

#include "\z\ace\addons\main\script_macros.hpp"

#if __has_include("\z\ace\addons\fastroping\script_macros.hpp")
#include "\z\ace\addons\fastroping\script_macros.hpp"
#else
#define EQUIP_FRIES_ATTRIBUTE
#endif

// Backwards compatibility
#undef GVAR
#define GVAR(var) TRIPLES(PREFIX,COMPONENT,var)
