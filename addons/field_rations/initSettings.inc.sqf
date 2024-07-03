[
    QXGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(Enabled_Description)],
    LSTRING(DisplayName),
    false,
    true,
    {},
    true // Needs restart
] call CBA_fnc_addSetting;

[
    QXGVAR(timeWithoutWater),
    "SLIDER",
    [LSTRING(TimeWithoutWater_DisplayName), LSTRING(TimeWithoutWater_Description)],
    LSTRING(DisplayName),
    [0.1, 168, 2, 1],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(timeWithoutFood),
    "SLIDER",
    [LSTRING(TimeWithoutFood_DisplayName), LSTRING(TimeWithoutFood_Description)],
    LSTRING(DisplayName),
    [0.1, 504, 2, 1],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(thirstQuenched),
    "SLIDER",
    [LSTRING(ThirstQuenched_DisplayName), LSTRING(ThirstQuenched_Description)],
    LSTRING(DisplayName),
    [0.1, 10, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(hungerSatiated),
    "SLIDER",
    [LSTRING(HungerSatiated_DisplayName), LSTRING(HungerSatiated_Description)],
    LSTRING(DisplayName),
    [0.1, 10, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(waterSourceActions),
    "LIST",
    [LSTRING(WaterSourceActions_DisplayName), LSTRING(WaterSourceActions_Description)],
    LSTRING(DisplayName),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(RefillOnly), ELSTRING(common,Enabled)], 2],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(terrainObjectActions),
    "CHECKBOX",
    [LSTRING(TerrainObjectActions_DisplayName), LSTRING(TerrainObjectActions_Description)],
    LSTRING(DisplayName),
    true,
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(affectAdvancedFatigue),
    "CHECKBOX",
    [LSTRING(AffectAdvancedFatigue_DisplayName), LSTRING(AffectAdvancedFatigue_Description)],
    LSTRING(DisplayName),
    true,
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(hudType),
    "LIST",
    [LSTRING(HudType_DisplayName), LSTRING(HudType_Description)],
    LSTRING(DisplayName),
    [[0, 1], [LSTRING(ColoredIcons), LSTRING(DrainingIcons)], 0],
    false,
    {
        QGVAR(hud) cutFadeOut 0;
    }
] call CBA_fnc_addSetting;

[
    QXGVAR(hudShowLevel),
    "LIST",
    [LSTRING(HudShowLevel_DisplayName), LSTRING(HudShowLevel_Description)],
    LSTRING(DisplayName),
    [[0, 10, 20, 30, 40, 50, 60, 70], [LSTRING(Always), "10%", "20%", "30%", "40%", "50%", "60%", "70%"], 0],
    false
] call CBA_fnc_addSetting;

[
    QXGVAR(hudTransparency),
    "LIST",
    [LSTRING(HudTransparency_DisplayName), LSTRING(HudTransparency_Description)],
    LSTRING(DisplayName),
    [[-1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8], [LSTRING(Dynamic), "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", 0], 0],
    false
] call CBA_fnc_addSetting;
