#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[QGVAR(allowDigging), "CHECKBOX", [localize LSTRING(settingAllowDigging_displayName), localize LSTRING(settingAllowDigging_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(allowCamouflage), "CHECKBOX", [localize LSTRING(settingAllowCamouflage_displayName), localize LSTRING(settingAllowCamouflage_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(digRequireEntrenchmentTool), "CHECKBOX", [localize LSTRING(settingDigRequireEntrenchmentTool_displayName), localize LSTRING(settingDigRequireEntrenchmentTool_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(camouflageRequireEntrenchmentTool), "CHECKBOX", [localize LSTRING(settingCamouflageRequireEntrenchmentTool_displayName), localize LSTRING(settingCamouflageRequireEntrenchmentTool_tooltip)], localize LSTRING(settingCategory), false] call CBA_Settings_fnc_init;

[QGVAR(allowSmallEnvelope), "CHECKBOX", [localize LSTRING(allowSmallEnvelope_displayName), localize LSTRING(allowSmallEnvelope_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(allowBigEnvelope), "CHECKBOX", [localize LSTRING(allowBigEnvelope_displayName), localize LSTRING(allowBigEnvelope_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(allowGigantEnvelope), "CHECKBOX", [localize LSTRING(allowGigantEnvelope_displayName), localize LSTRING(allowGigantEnvelope_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(allowVehicleEnvelope), "CHECKBOX", [localize LSTRING(allowVehicleEnvelope_displayName), localize LSTRING(allowVehicleEnvelope_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
