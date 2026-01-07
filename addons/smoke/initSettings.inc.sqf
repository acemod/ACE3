private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_DisplayName), LSTRING(enabled_Description)],
    _category,
    true,
    1,
    {
        [QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged);
        GVAR(ppHandleDynamicBlur) ppEffectEnable _this;
        GVAR(ppHandleColorCorrections) ppEffectEnable _this;
        if (_this) then {
            if (GVAR(pfh) == -1) then {
                GVAR(pfh) = [{
                    [ace_player] call FUNC(pfh);
                }] call CBA_fnc_addPerFrameHandler;
            };
        } else {
            if (GVAR(pfh) != -1) then {
                [GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
                GVAR(pfh) = -1;
            };
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(effectFactor), "SLIDER",
    [LSTRING(effectFactor_DisplayName), LSTRING(effectFactor_Description)],
    _category,
    [0, 1, 0.5, 0.1],
    1,
    {[QGVAR(effectFactor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(recoveryFactor), "SLIDER",
    [LSTRING(recoveryFactor_DisplayName), LSTRING(recoveryFactor_Description)],
    _category,
    [0, 1, 0.5, 0.1],
    1,
    {[QGVAR(recoveryFactor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
