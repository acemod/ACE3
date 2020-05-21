// CBA Settings [ADDON: ace_gunbag]:

[
    QGVAR(swapGunbagEnabled), "CHECKBOX",
    [LSTRING(SwapGunbagEnabled_DisplayName), LSTRING(SwapGunbagEnabled_Description)],
    LSTRING(DisplayName_Settings),
    false, // default value
    true, // isGlobal
    {[QGVAR(swapGunbagEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;