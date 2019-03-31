// CBA Settings [ADDON: ace_medical_blood]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QGVAR(enabledFor), "LIST",
    [LSTRING(MedicalBloodSettings_enabledFor_DisplayName), LSTRING(MedicalBloodSettings_enabledFor_Description)],
    _categoryArray,
    [[0,1,2],[LELSTRING(Common,Disabled),LLSTRING(enabledFor_OnlyPlayers),LELSTRING(Common,Enabled)],2], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(enabledFor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
