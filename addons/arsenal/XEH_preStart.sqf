#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Caches for FUNC(baseX)
uiNamespace setVariable [QGVAR(baseWeaponNameCache), createHashMap];
uiNamespace setVariable [QGVAR(baseBackpackCache), createHashMap];

// Caches for names, pictures, mod icons
uiNamespace setVariable [QGVAR(addListBoxItemCache), createHashMap];
uiNamespace setVariable [QGVAR(rightPanelCache), createHashMap];
uiNamespace setVariable [QGVAR(sortCache), createHashMap];
uiNamespace setVariable [QGVAR(isMiscItemCache), createHashMap];

call FUNC(scanConfig);
