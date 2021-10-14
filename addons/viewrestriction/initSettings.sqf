[
    QXGVAR(mode),
    "LIST",
    [LSTRING(Mode), LSTRING(ModeDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    [[0, 1, 2, 3], [LSTRING(Disabled), LSTRING(FirstPerson), LSTRING(ThirdPerson), LSTRING(Selective)], 0],
    true,
    {[QGVAR(mode), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(modeSelectiveFoot),
    "LIST",
    [LSTRING(ModeSelectiveFoot), LSTRING(ModeSelectiveFootDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    [[0, 1, 2], [LSTRING(Disabled), LSTRING(FirstPerson), LSTRING(ThirdPerson)], 0],
    true,
    {[QGVAR(modeSelectiveFoot), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(modeSelectiveLand),
    "LIST",
    [LSTRING(ModeSelectiveLand), LSTRING(ModeSelectiveLandDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    [[0, 1, 2], [LSTRING(Disabled), LSTRING(FirstPerson), LSTRING(ThirdPerson)], 0],
    true,
    {[QGVAR(modeSelectiveLand), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(modeSelectiveAir),
    "LIST",
    [LSTRING(ModeSelectiveAir), LSTRING(ModeSelectiveAirDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    [[0, 1, 2], [LSTRING(Disabled), LSTRING(FirstPerson), LSTRING(ThirdPerson)], 0],
    true,
    {[QGVAR(modeSelectiveAir), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(modeSelectiveSea),
    "LIST",
    [LSTRING(ModeSelectiveSea), LSTRING(ModeSelectiveSeaDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    [[0, 1, 2], [LSTRING(Disabled), LSTRING(FirstPerson), LSTRING(ThirdPerson)], 0],
    true,
    {[QGVAR(modeSelectiveSea), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(preserveView),
    "CHECKBOX",
    [LSTRING(SettingPreserveViewName), LSTRING(SettingPreserveViewDesc)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    false,
    false,
    LINKFUNC(switchPreserveView)
] call CBA_fnc_addSetting;
