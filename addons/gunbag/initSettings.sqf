// CBA Settings [ADDON: ace_gunbag]:

[
    QGVAR(swapGunbagEnabled), "CHECKBOX",
    [LSTRING(SwapGunbagEnabled_DisplayName), LSTRING(SwapGunbagEnabled_Description)],
    LSTRING(DisplayName_Settings),
    false, // default value
    true // isGlobal
] call CBA_settings_fnc_init;
