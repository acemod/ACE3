// CBA Settings [ADDON: ace_artillerytables]:

[
    QGVAR(advancedCorrections), "CHECKBOX",
    [LSTRING(advancedCorrections_displayName), LSTRING(advancedCorrections_description)],
    "ACE Artillery",
    false, // default value
    true, // isGlobal
    {[QGVAR(advancedCorrections), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(disableArtilleryComputer), "CHECKBOX",
    [LSTRING(disableArtilleryComputer_displayName), LSTRING(disableArtilleryComputer_description)],
    "ACE Artillery",
    false, // default value
    true, // isGlobal
    {[QGVAR(disableArtilleryComputer), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;
