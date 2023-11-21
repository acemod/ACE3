[
    QXGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(EnabledDesc)],
    format ["ACE %1", LLSTRING(Module)],
    false,
    true,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(delay),
    "SLIDER",
    [LSTRING(Delay), LSTRING(DelayDesc)],
    format ["ACE %1", LLSTRING(Module)],
    [0, 60, 15, -1],
    true,
    {[QGVAR(delay), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(endMission),
    "LIST",
    [LSTRING(EndMission), LSTRING(EndMissionDesc)],
    format ["ACE %1", LLSTRING(Module)],
    [[0, 1, 2], [ELSTRING(Common,Disabled), LSTRING(Instant), LSTRING(Delayed)], 0],
    true,
    {[QGVAR(delay), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(log),
    "CHECKBOX",
    [LSTRING(Log), LSTRING(LogDesc)],
    format ["ACE %1", LLSTRING(Module)],
    false,
    true,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(transferLoadout),
    "LIST",
    [LSTRING(TransferLoadout), LSTRING(TransferLoadoutDesc)],
    format ["ACE %1", LLSTRING(Module)],
    [[0, 1, 2], [ELSTRING(Common,Disabled), LSTRING(TransferLoadoutCurrent), LSTRING(TransferLoadoutConfig)], 0],
    true,
    {},
    true // needs mission restart
] call CBA_fnc_addSetting;
