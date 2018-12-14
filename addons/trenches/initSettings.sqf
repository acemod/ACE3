[
   QGVAR(allowDigging),
   "CHECKBOX",
   [localize LSTRING(settingAllowDigging_displayName),
   localize LSTRING(settingAllowDigging_tooltip)],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
   QGVAR(allowCamouflage),
   "CHECKBOX",
   [localize LSTRING(settingAllowCamouflage_displayName),
   localize LSTRING(settingAllowCamouflage_tooltip)],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
   QGVAR(camouflageRequireEntrenchmentTool),
   "CHECKBOX", [localize LSTRING(settingCamouflageRequireEntrenchmentTool_displayName),
   localize LSTRING(settingCamouflageRequireEntrenchmentTool_tooltip)],
   localize LSTRING(settingCategory),
   false
] call CBA_Settings_fnc_init;

[
   QGVAR(buildFatigueFactor),
   "SLIDER",
   [localize LSTRING(settingBuildFatigueFactor_displayName),
   localize LSTRING(settingBuildFatigueFactor_tooltip)],
   localize LSTRING(settingCategory),
   [0, 5, 1, 1]
] call CBA_Settings_fnc_init;

[
   QGVAR(stopBuildingAtFatigueMax),
   "CHECKBOX",
   [localize LSTRING(stopBuildingAtFatigueMax_displayName),
   localize LSTRING(stopBuildingAtFatigueMax_tooltip)],
   localize LSTRING(settingCategory),
   false
] call CBA_Settings_fnc_init;

[
   QGVAR(enableAutomaticFilePath),
   "CHECKBOX",
   [localize LSTRING(enableAutomaticFilePath_displayName),
   localize LSTRING(enableAutomaticFilePath_tooltip)],
   localize LSTRING(settingCategory),
   false
] call CBA_Settings_fnc_init;

[
   QGVAR(allowShortEnvelope),
   "CHECKBOX",
   [localize LSTRING(allowShortEnvelope_displayName),
   localize LSTRING(allowShortEnvelope_tooltip)],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
   QGVAR(allowSmallEnvelope),
   "CHECKBOX",
   [localize LSTRING(allowSmallEnvelope_displayName),
   localize LSTRING(allowSmallEnvelope_tooltip)],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
QGVAR(allowBigEnvelope),
"CHECKBOX",
[localize LSTRING(allowBigEnvelope_displayName),
localize LSTRING(allowBigEnvelope_tooltip)],
localize LSTRING(settingCategory),
true
] call CBA_Settings_fnc_init;

[
   QGVAR(allowLargeEnvelope),
   "CHECKBOX",
   [localize LSTRING(allowLargeEnvelope_displayName),
   localize LSTRING(allowLargeEnvelope_tooltip)],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
   QGVAR(allowVehicleEnvelope),
   "CHECKBOX",
   [
      localize LSTRING(allowVehicleEnvelope_displayName),
      localize LSTRING(allowVehicleEnvelope_tooltip)
   ],
   localize LSTRING(settingCategory),
   true
] call CBA_Settings_fnc_init;

[
   QGVAR(shortEnvelopeDigTime),
   "SLIDER",
   localize LSTRING(ShortEnvelopeDigTime),
   localize LSTRING(settingCategory),
   [5, 300, 20, 0]
] call CBA_Settings_fnc_init;

[
   QGVAR(smallEnvelopeDigTime),
   "SLIDER",
   localize LSTRING(SmallEnvelopeDigTime),
   localize LSTRING(settingCategory),
   [5, 450, 30, 0]
] call CBA_Settings_fnc_init;

[
   QGVAR(bigEnvelopeDigTime),
   "SLIDER",
   localize LSTRING(BigEnvelopeDigTime),
   localize LSTRING(settingCategory),
   [5, 600, 40, 0]
] call CBA_Settings_fnc_init;

[
   QGVAR(largeEnvelopeDigTime),
   "SLIDER",
   localize LSTRING(LargeEnvelopeDigTime),
   localize LSTRING(settingCategory),
   [5, 900, 90, 0]
] call CBA_Settings_fnc_init;

[
   QGVAR(vehicleEnvelopeDigTime),
   "SLIDER",
   localize LSTRING(VehicleEnvelopeDigTime),
   localize LSTRING(settingCategory),
   [5, 1200, 120, 0]
] call CBA_Settings_fnc_init;
