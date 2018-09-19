#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

RHS_Retread_Enabled = false;
rhs_btr70_EnableRetread = false;
rhs_TypeTirePressure = 1;
RHS_BTR_Effects_Init = true;

ADDON = true;
