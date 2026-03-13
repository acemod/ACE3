// CBA Settings [ADDON: ace_radiodirectionfinder]:

private _categoryArray = ["ACE Radiodirectionfinder"];

[
    QGVAR(showUAV), "CHECKBOX",
    ["showUAV"], // [LSTRING(), LSTRING()],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(showUAV), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

if (isClass (configFile >> "CfgPatches" >> "acre_sys_core")) then {
    [
        QGVAR(showACRE), "CHECKBOX",
        ["showACRE"], // [LSTRING(), LSTRING()],
        _categoryArray,
        false, // default value
        true, // isGlobal
        {[QGVAR(showACRE), _this] call EFUNC(common,cbaSettings_settingChanged)}
    ] call CBA_settings_fnc_init;
};
