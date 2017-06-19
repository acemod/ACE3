#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];

GVAR(serverConfigGeneration) = 0;
GVAR(ClientSettingsExportIncluded) = false;
GVAR(serverSideOptions) = [];
GVAR(serverSideColors) = [];
GVAR(serverSideValues) = [];
GVAR(categories) = [];
GVAR(currentCategorySelection) = 0;

ADDON = true;
