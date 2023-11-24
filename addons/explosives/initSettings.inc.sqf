private _categoryStr = format ["ACE %1", LLSTRING(Menu)];

[
    QGVAR(requireSpecialist),
    "CHECKBOX",
    [LLSTRING(RequireSpecialist_DisplayName),LLSTRING(RequireSpecialist_Description)],
    _categoryStr,
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(punishNonSpecialists),
    "CHECKBOX",
    [LLSTRING(PunishNonSpecialists_DisplayName),LLSTRING(PunishNonSpecialists_Description)],
    _categoryStr,
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(explodeOnDefuse),
    "CHECKBOX",
    [LLSTRING(ExplodeOnDefuse_DisplayName),LLSTRING(ExplodeOnDefuse_Description)],
    _categoryStr,
    true,
    true
] call CBA_fnc_addSetting;

// Variable names to preserve https://github.com/acemod/ACE3/pull/6882
[
    QGVAR(customTimerMin),
    "TIME",
    [LLSTRING(TimerMin_DisplayName), LLSTRING(TimerMin_Description)],
    [_categoryStr, LLSTRING(ExplosiveTimer)],
    [0, 5999, TIMER_VALUE_MIN],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(customTimerMax),
    "TIME",
    [LLSTRING(TimerMax_DisplayName), LLSTRING(TimerMax_Description)],
    [_categoryStr, LLSTRING(ExplosiveTimer)],
    [0, 5999, TIMER_VALUE_MAX],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(customTimerDefault),
    "TIME",
    [LLSTRING(TimerDefault_DisplayName), LLSTRING(TimerDefault_Description)],
    [_categoryStr, LLSTRING(ExplosiveTimer)],
    [0, 5999, TIMER_VALUE_DEFAULT],
    false
] call CBA_fnc_addSetting;
