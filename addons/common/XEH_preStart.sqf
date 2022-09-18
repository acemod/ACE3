#include "script_component.hpp"

#include "XEH_PREP.hpp"

// These functions are used for the ace arsenal, one of which are called in preStart (ace_arsenal_fnc_scanConfig)
// Cache for FUNC(getAddon)
uiNamespace setVariable [QGVAR(addonCache), createHashMap];

// Cache for FUNC(baseWeapon)
uiNamespace setVariable [QGVAR(baseWeaponNameCache), createHashMap];

// Cache for FUNC(getConfigName)
uiNamespace setVariable [QGVAR(configNames), createHashMap];
