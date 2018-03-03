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

[QGVAR(smallEnvelopeDigTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_SmallEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 20, 0]] call CBA_Settings_fnc_init;
[QGVAR(smallEnvelopeRemovalTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_SmallEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 12, 0]] call CBA_Settings_fnc_init;
[QGVAR(bigEnvelopeDigTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_BigEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 25, 0]] call CBA_Settings_fnc_init;
[QGVAR(bigEnvelopeRemovalTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_BigEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 15, 0]] call CBA_Settings_fnc_init;
[QGVAR(gigantEnvelopeDigTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_GigantEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 30, 0]] call CBA_Settings_fnc_init;
[QGVAR(gigantEnvelopeRemovalTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_GigantEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 20, 0]] call CBA_Settings_fnc_init;
[QGVAR(vehicleEnvelopeDigTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_VehicleEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 60, 0]] call CBA_Settings_fnc_init;
[QGVAR(vehicleEnvelopeRemovalTime), "SLIDER", localize LSTRING(STR_ACE_Trenches_VehicleEnvelopeDigTime), localize LSTRING(settingCategory), [5, 300, 30, 0]] call CBA_Settings_fnc_init;
