// CBA Settings [ADDON: ace_repair]:

[
    QGVAR(displayTextOnRepair), "CHECKBOX",
    [LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    true, // default value
    false, // isGlobal
    {[QGVAR(displayTextOnRepair), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(engineerSetting_repair), "LIST",
    [LSTRING(engineerSetting_Repair_name), LSTRING(engineerSetting_Repair_description)], 
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(engineerSetting_repair), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(engineerSetting_wheel), "LIST",
    [LSTRING(engineerSetting_Wheel_name), LSTRING(engineerSetting_Wheel_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(engineerSetting_wheel), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(repairDamageThreshold), "SLIDER",
    [LSTRING(repairDamageThreshold_name), LSTRING(repairDamageThreshold_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [0,1,0.6,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(repairDamageThreshold), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(repairDamageThreshold_engineer), "SLIDER",
    [LSTRING(repairDamageThreshold_Engineer_name), LSTRING(repairDamageThreshold_Engineer_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [0,1,0.4,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(repairDamageThreshold_engineer), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(consumeItem_toolKit), "LIST", // fnc_repair expects number
    [LSTRING(consumeItem_ToolKit_name), LSTRING(consumeItem_ToolKit_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1],[ELSTRING(common,No), ELSTRING(common,Yes)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(consumeItem_toolKit), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(fullRepairLocation), "LIST",
    [LSTRING(fullRepairLocation), LSTRING(fullRepairLocation_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1,2,3,4],[LSTRING(useAnywhere), LSTRING(repairVehicleOnly), LSTRING(repairFacilityOnly), LSTRING(vehicleAndFacility), ELSTRING(common,Disabled)],2], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(fullRepairLocation), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(engineerSetting_fullRepair), "LIST",
    [LSTRING(engineerSetting_fullRepair_name), LSTRING(engineerSetting_fullRepair_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],2], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(engineerSetting_fullRepair), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(addSpareParts), "CHECKBOX",
    [LSTRING(addSpareParts_name), LSTRING(addSpareParts_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    true, // default value
    true, // isGlobal
    {[QGVAR(addSpareParts), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(wheelRepairRequiredItems), "LIST",
    [LSTRING(wheelRepairRequiredItems_name), LSTRING(wheelRepairRequiredItems_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    [[0,1],["None", "ToolKit"],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(wheelRepairRequiredItems), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(autoShutOffEngineWhenStartingRepair), "CHECKBOX",
    [LSTRING(autoShutOffEngineWhenStartingRepair_name), LSTRING(autoShutOffEngineWhenStartingRepair_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize "str_state_repair"],
    false, // default value
    true, // isGlobal
    {[QGVAR(autoShutOffEngineWhenStartingRepair), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
