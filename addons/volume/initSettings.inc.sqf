[
    QXGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(KeybindDescription)],
    format ["ACE %1", LLSTRING(Name)],
    false
] call CBA_fnc_addSetting;

[
    QXGVAR(reduction),
    "LIST",
    [LSTRING(Reduction), LSTRING(ReductionDescription)],
    format ["ACE %1", LLSTRING(Name)],
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"], 5]
] call CBA_fnc_addSetting;

[
    QXGVAR(fadeDelay),
    "LIST",
    [LSTRING(FadeDelay), LSTRING(FadeDelayDescription)],
    format ["ACE %1", LLSTRING(Name)],
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], ["0s", "1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "10s"], 1]
] call CBA_fnc_addSetting;

[
    QXGVAR(lowerInVehicles),
    "CHECKBOX",
    [LSTRING(LowerInVehicles), LSTRING(LowerInVehiclesDescription)],
    format ["ACE %1", LLSTRING(Name)],
    false
] call CBA_fnc_addSetting;

[
    QXGVAR(showNotification),
    "CHECKBOX",
    [LSTRING(ShowNotification), LSTRING(ShowNotificationDescription)],
    format ["ACE %1", LLSTRING(Name)],
    true
] call CBA_fnc_addSetting;

[
    QXGVAR(remindIfLowered),
    "CHECKBOX",
    [LSTRING(RemindIfLowered), LSTRING(RemindIfLoweredDescription)],
    format ["ACE %1", LLSTRING(Name)],
    false
] call CBA_fnc_addSetting;
