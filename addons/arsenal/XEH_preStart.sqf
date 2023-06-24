#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache for FUNC(baseWeapon)
uiNamespace setVariable [QGVAR(baseWeaponNameCache), createHashMap];

call FUNC(scanConfig);
