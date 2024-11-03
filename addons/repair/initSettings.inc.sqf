private _category = format ["ACE %1", LLSTRING(Repair)];
private _catFullRepair = [_category, LLSTRING(fullRepair)];

[
    QGVAR(enabled), "CHECKBOX",
    ELSTRING(common,Enabled),
    _category,
    true,
    true,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextOnRepair), "CHECKBOX",
    [LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
    _category,
    true // default value
] call CBA_fnc_addSetting;

[
    QGVAR(engineerSetting_repair), "LIST",
    [LSTRING(engineerSetting_Repair_name), LSTRING(engineerSetting_Repair_description)],
    _category,
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],1], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(engineerSetting_wheel), "LIST",
    [LSTRING(engineerSetting_Wheel_name), LSTRING(engineerSetting_Wheel_description)],
    _category,
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],0], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(patchWheelEnabled), "LIST",
    [LSTRING(patchWheelEnabled_name), LSTRING(patchWheelEnabled_description)],
    _category,
    [[-1,0,1,2],["str_player_none", LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],1], // default value
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(patchWheelRequiredItems),
    "LIST",
    [LSTRING(patchWheelRequiredItems_DisplayName), LSTRING(patchWheelRequiredItems_Description)],
    _category,
    [[[], [ANY_TOOLKIT_FAKECLASS]], ["STR_A3_None", "STR_A3_CfgWeapons_Toolkit0"], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(patchWheelLocation),
    "LIST",
    [LSTRING(patchWheelLocation_DisplayName), LSTRING(patchWheelLocation_Description)],
    _category,
    [[["ground", "vehicle"], ["vehicle"], ["ground"]], ["str_difficulty_any", LSTRING(patchWheelOnVehicle), LSTRING(patchWheelOnGround)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(repairDamageThreshold), "SLIDER",
    [LSTRING(repairDamageThreshold_name), LSTRING(repairDamageThreshold_description)],
    _category,
    [0, 1, 0.6, 1, true],
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(repairDamageThreshold_engineer), "SLIDER",
    [LSTRING(repairDamageThreshold_Engineer_name), LSTRING(repairDamageThreshold_Engineer_description)],
    _category,
    [0, 1, 0.4, 1, true],
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(consumeItem_toolKit), "LIST", // fnc_repair expects number
    [LSTRING(consumeItem_ToolKit_name), LSTRING(consumeItem_ToolKit_description)],
    _category,
    [[0,1],[ELSTRING(common,No), ELSTRING(common,Yes)],0], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(locationsBoostTraining),
    "CHECKBOX",
    [ELSTRING(common,LocationsBoostTraining_DisplayName), LSTRING(LocationsBoostTraining_Description)],
    _category,
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fullRepairLocation), "LIST",
    [LSTRING(fullRepairLocation), LSTRING(fullRepairLocation_description)],
    _catFullRepair,
    [[0,1,2,3,4],[LSTRING(useAnywhere), LSTRING(repairVehicleOnly), LSTRING(repairFacilityOnly), LSTRING(vehicleAndFacility), ELSTRING(common,Disabled)],2], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(engineerSetting_fullRepair), "LIST",
    [LSTRING(engineerSetting_fullRepair_name), LSTRING(engineerSetting_fullRepair_description)],
    _catFullRepair,
    [[0,1,2],[LSTRING(engineerSetting_anyone), LSTRING(engineerSetting_EngineerOnly), LSTRING(engineerSetting_AdvancedOnly)],2], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(timeCoefficientFullRepair), "SLIDER",
    [LSTRING(timeCoefficientFullRepair_name), LSTRING(timeCoefficientFullRepair_description)],
    _catFullRepair,
    [0,3,1.5,2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(addSpareParts), "CHECKBOX",
    [LSTRING(addSpareParts_name), LSTRING(addSpareParts_description)],
    _category,
    true, // default value
    true, // isGlobal
    {[QGVAR(addSpareParts), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(wheelRepairRequiredItems),
    "LIST",
    [LSTRING(WheelRepairRequiredItems_DisplayName), LSTRING(WheelRepairRequiredItems_Description)],
    _category,
    [[[], [ANY_TOOLKIT_FAKECLASS]], ["STR_A3_None", "STR_A3_CfgWeapons_Toolkit0"], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(miscRepairRequiredItems),
    "LIST",
    [LSTRING(MiscRepairRequiredItems_DisplayName), LSTRING(MiscRepairRequiredItems_Description)],
    _category,
    [[[], [ANY_TOOLKIT_FAKECLASS]], ["STR_A3_None", "STR_A3_CfgWeapons_Toolkit0"], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fullRepairRequiredItems),
    "LIST",
    [LSTRING(FullRepairRequiredItems_DisplayName), LSTRING(FullRepairRequiredItems_Description)],
    _catFullRepair,
    [[[], [ANY_TOOLKIT_FAKECLASS]], ["STR_A3_None", "STR_A3_CfgWeapons_Toolkit0"], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(autoShutOffEngineWhenStartingRepair), "CHECKBOX",
    [LSTRING(autoShutOffEngineWhenStartingRepair_name), LSTRING(autoShutOffEngineWhenStartingRepair_description)],
    _category,
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(miscRepairTime), "SLIDER",
    [LSTRING(miscRepairTime_name), LSTRING(miscRepairTime_description)],
    _category,
    [0,60,15,-1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true
] call CBA_fnc_addSetting;

[
    QGVAR(wheelChangeTime), "SLIDER",
    [LSTRING(wheelChangeTime_name), LSTRING(wheelChangeTime_description)],
    _category,
    [0,60,10,-1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true
] call CBA_fnc_addSetting;

[
    QGVAR(patchWheelTime),
    "SLIDER",
    [LSTRING(patchWheelTime_DisplayName), LSTRING(patchWheelTime_Description)],
    _category,
    [0.1, 60, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(patchWheelMaximumRepair),
    "SLIDER",
    [LSTRING(patchWheelMaximumRepair_DisplayName), LSTRING(patchWheelMaximumRepair_Description)],
    _category,
    [0, 1, 0.3, 1, true],
    true
] call CBA_fnc_addSetting;
