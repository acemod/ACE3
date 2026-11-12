[
    QGVAR(keepEngineRunning),
    "CHECKBOX",
    [LSTRING(SettingKeepEngineRunningName), LSTRING(SettingKeepEngineRunningDesc)],
    ELSTRING(common,ACEKeybindCategoryVehicles),
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(hideEjectAction),
    "CHECKBOX",
    [LSTRING(HideEjectAction), LSTRING(HideEjectActionTooltip)],
    ELSTRING(common,ACEKeybindCategoryVehicles),
    true,
    2, {
        #define ACTION_ENUM_EJECT 51
        if (isNil "CBA_fnc_hideAction") then {
            hideActions [_this, [ACTION_ENUM_EJECT]];
        } else {
            [ACTION_ENUM_EJECT, QUOTE(ADDON), _this] call CBA_fnc_hideAction;
        };
    },
    true // needs restart (for ace_aircraft's initEjectAction text color)
] call CBA_fnc_addSetting;

[
    QGVAR(speedLimiterStep),
    "SLIDER",
    LSTRING(SpeedLimiterStep),
    ELSTRING(common,ACEKeybindCategoryVehicles),
    [1, 10, 5, -1] // whole numbers only
] call CBA_fnc_addSetting;
