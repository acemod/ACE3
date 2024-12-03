#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache for FUNC(baseWeapon)
uiNamespace setVariable [QGVAR(baseWeaponNameCache), createHashMap];

// Caches for names, pictures, mod icons
uiNamespace setVariable [QGVAR(addListBoxItemCache), createHashMap];
uiNamespace setVariable [QGVAR(rightPanelCache), createHashMap];
uiNamespace setVariable [QGVAR(sortCache), createHashMap];
uiNamespace setVariable [QGVAR(isMiscItemCache), createHashMap];

call FUNC(scanConfig);
