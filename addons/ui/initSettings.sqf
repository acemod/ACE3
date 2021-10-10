if (productVersion select 4 == 'Development') then {
    [
        QGVAR(devWatermark),
        "CHECKBOX",
        LSTRING(devWatermark),
        "ACE " + LLSTRING(Category),
        true
    ] call CBA_fnc_addSetting;
};

[
    QGVAR(enableSpeedIndicator),
    "CHECKBOX",
    [LSTRING(EnableSpeedIndicator), LSTRING(EnableSpeedIndicator_Description)],
    "ACE " + LLSTRING(Category),
    true,
    true, {
        if (!_this) then {
            private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];
            _speedIndicator ctrlSetText "";
        };
    }
] call CBA_fnc_addSetting;
