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

if (hasInterface) then {
    [[format ["ACE3 %1", localize LSTRING(DumpDebug)], localize LSTRING(DumpDebugTooltip)], QGVAR(MainMenuHelperDumpDebug)] call CBA_fnc_addPauseMenuOption;
    [[format ["ACE3 %1", localize LSTRING(headBugFix)], localize LSTRING(headBugFixTooltip)], QGVAR(MainMenuHelperHeadBugFix)] call CBA_fnc_addPauseMenuOption;
};

ADDON = true;
