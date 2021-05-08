if (productVersion select 4 == 'Development') then {
    [
        QGVAR(devWatermark),
        "CHECKBOX",
        LSTRING(devWatermark),
        "ACE " + LLSTRING(Category),
        true
    ] call CBA_fnc_addSetting;
};
