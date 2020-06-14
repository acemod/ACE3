// CBA Settings [ADDON: ace_gunbag]:

[
    QGVAR(swapGunbagEnabled), "CHECKBOX",
    [LSTRING(SwapGunbagEnabled_DisplayName), LSTRING(SwapGunbagEnabled_Description)],
    ["ACE Uncategorized", LLSTRING(DisplayName_Settings)],
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
