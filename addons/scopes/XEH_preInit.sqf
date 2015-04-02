#include "script_component.hpp"

ADDON = false;

PREP(adjustScope);
PREP(canAdjustScope);
PREP(firedEH);
PREP(getOptics);
PREP(inventoryCheck);
PREP(onDrawShortdot);
PREP(showZeroing);

GVAR(fadeScript) = scriptNull;

ADDON = true;
