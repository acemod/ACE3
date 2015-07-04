#include "script_component.hpp"

ADDON = false;

PREP(addHead);
PREP(removeHead);
PREP(wearHeadBag);

ADDON = true;


GVAR(EH_KeyDown_HeadBagOverlay) = -1;
GVAR(EH_Unload_HeadBagESC) = -1;
