#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (hasInterface) then {
    [[format ["ACE %1", localize LSTRING(DumpDebug)], localize LSTRING(DumpDebugTooltip)], QGVAR(MainMenuHelperDumpDebug)] call CBA_fnc_addPauseMenuOption;
    [[format ["ACE %1", localize LSTRING(headBugFix)], localize LSTRING(headBugFixTooltip)], QGVAR(MainMenuHelperHeadBugFix)] call CBA_fnc_addPauseMenuOption;
};

ADDON = true;
