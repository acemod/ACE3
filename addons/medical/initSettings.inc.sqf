[
    QGVAR(limping),
    "LIST",
    [LSTRING(Limping_DisplayName), LSTRING(Limping_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(Limping_LimpOnOpenWounds), LSTRING(Limping_LimpRequiresStitching)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fractures),
    "LIST",
    [LSTRING(Fractures_DisplayName), LSTRING(Fractures_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3], [ELSTRING(common,Disabled), LSTRING(Fractures_SplintHealsFully), LSTRING(Fractures_SplintHealsNoSprint), LSTRING(Fractures_SplintHealsNoJog)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fractureChance),
    "SLIDER",
    [LSTRING(FractureChance_DisplayName), LSTRING(FractureChance_Description)],
    LSTRING(Category),
    [0, 1, 0.8, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spontaneousWakeUpChance),
    "SLIDER",
    [LSTRING(SpontaneousWakeUpChance_DisplayName), LSTRING(SpontaneousWakeUpChance_Description)],
    LSTRING(Category),
    [0, 1, 0.05, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spontaneousWakeUpEpinephrineBoost),
    "SLIDER",
    [LSTRING(spontaneousWakeUpEpinephrineBoost_DisplayName), LSTRING(spontaneousWakeUpEpinephrineBoost_Description)],
    LSTRING(Category),
    [1, 30, 1, 1],
    true
] call CBA_settings_fnc_init;
/*
[
    QGVAR(armorMultiplayer),
    "SLIDER",
    ["Armor Multiplier", "Custom Armor multiplier"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 100, 0, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(minArmor),
    "SLIDER",
    ["Minimal Armor", "Not adjusted by modification"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 50, 5, 0],
    true
] call CBA_settings_fnc_init;
*/
[
    QGVAR(armorMultiplier),
    "SLIDER",
    ["Armor Damage Multiplier", "Damage = Damage + (Armor x (Multiplier / 10000))"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 10000, 40.00, 2],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(armorMultiplierMax),
    "SLIDER",
    ["Armor Damage Multiplier Max", "Adjusted Damage min Armor Damage Multiplier Max"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 100, 2.00, 2],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(armorMultiplierMin),
    "SLIDER",
    ["Min Armor for Multiplier", "Min Armor required for adjustment"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 1000, 19.00, 2],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(armorMultiplierCap),
    "SLIDER",
    ["Armor Value Cap", "Cap for Armor in Calucalation"],
    [ELSTRING(medical,Category), "Modifications"],
    [0, 100, 80, 0],
    true
] call CBA_settings_fnc_init;
