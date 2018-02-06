#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Arsenal
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];

[QGVAR(camInverted), "CHECKBOX", localize LSTRING(invertCameraSetting), localize LSTRING(settingCategory), false] call CBA_Settings_fnc_init;
[QGVAR(enableModIcons), "CHECKBOX", [LSTRING(modIconsSetting), LSTRING(modIconsTooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(fontHeight), "SLIDER", [LSTRING(fontHeightSetting), LSTRING(fontHeightTooltip)], localize LSTRING(settingCategory), [1, 10, 4.5, 1]] call CBA_Settings_fnc_init;

// Arsenal loadouts
[QGVAR(allowDefaultLoadouts), "CHECKBOX", [LSTRING(allowDefaultLoadoutsSetting), LSTRING(defaultLoadoutsTooltip)], localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(allowSharedLoadouts), "CHECKBOX", localize LSTRING(allowSharingSetting), localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(EnableRPTLog), "CHECKBOX", [LSTRING(printToRPTSetting), LSTRING(printToRPTTooltip)], localize LSTRING(settingCategory), false, false] call CBA_Settings_fnc_init;

ADDON = true;
