// CBA Settings [ADDON: ace_cargo]:

[
    QGVAR(enable), "CHECKBOX",
    [LSTRING(ModuleSettings_enable), LSTRING(ModuleSettings_enable_Description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize LSTRING(openMenu)],
    true, // default value
    true, // isGlobal
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(paradropTimeCoefficent), "SLIDER",
    [LSTRING(paradropTimeCoefficent), LSTRING(paradropTimeCoefficent_description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize LSTRING(openMenu)],
    [0,10,2.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(paradropTimeCoefficent), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
