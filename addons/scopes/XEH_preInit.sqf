#include "script_component.hpp"

ADDON = false;

PREP(adjustScope);
PREP(canAdjustScope);
PREP(firedEH);
PREP(getOptics);
PREP(hideZeroing);
PREP(inventoryCheck);

GVAR(fadeScript) = scriptNull;

ADDON = true;
