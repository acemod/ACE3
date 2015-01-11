// #define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

ADDON = false;

[["ACE_120Tampella_Baseplate", "ACE_120Tampella_Barrel"], [ace_sys_interaction_key], -2, [QPATHTO_F(fnc_menuDef), "main"]] call CBA_ui_fnc_add; // TODO: Integrate to sys_crewserved later

ADDON = true;
