private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(smoke_enabled), "CHECKBOX",
    [LSTRING(smoke_enabled_DisplayName), LSTRING(smoke_enabled_Description)],
    [_category, localize LSTRING(smoke_DisplayName)],
    true,
    1,
    {
        [QGVAR(smoke_enabled), _this] call EFUNC(common,cbaSettings_settingChanged);
        if (!hasInterface) exitWith {};
        private _showEffects = _this && !EGVAR(common,OldIsCamera);
        GVAR(ppHandleDynamicBlur) ppEffectEnable _showEffects;
        GVAR(ppHandleColorCorrections) ppEffectEnable _showEffects;
        if (_this) then {
            if (GVAR(smoke_pfh) == -1) then {
                GVAR(smoke_pfh) = [{
                    [ace_player] call FUNC(smoke_pfh);
                }, PFH_INTERVAL] call CBA_fnc_addPerFrameHandler;
            };
        } else {
            if (GVAR(smoke_pfh) != -1) then {
                [GVAR(smoke_pfh)] call CBA_fnc_removePerFrameHandler;
                GVAR(smoke_pfh) = -1;
                if (!isNil QEFUNC(medical_vitals,removeSpO2DutyFactor)) then { [QUOTE(ADDON)] call EFUNC(medical_vitals,removeSpO2DutyFactor); };
            };
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(smoke_effectFactor), "SLIDER",
    [LSTRING(smoke_effectFactor_DisplayName), LSTRING(smoke_effectFactor_Description)],
    [_category, localize LSTRING(smoke_DisplayName)],
    [0, 1, 0.5, 0, true],
    1,
    {[QGVAR(smoke_effectFactor), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(smoke_recoveryFactor), "SLIDER",
    [LSTRING(smoke_recoveryFactor_DisplayName), LSTRING(smoke_recoveryFactor_Description)],
    [_category, localize LSTRING(smoke_DisplayName)],
    [0, 1, 0.5, 0, true],
    1,
    {[QGVAR(smoke_recoveryFactor), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;
