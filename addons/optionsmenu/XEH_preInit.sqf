#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

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
