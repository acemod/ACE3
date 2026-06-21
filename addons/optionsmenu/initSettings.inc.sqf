private _category = format ["ACE %1", LELSTRING(common,DisplayName)];

[
    QGVAR(showNewsOnMainMenu), "CHECKBOX",
    LSTRING(showNewsOnMainMenu_name),
    _category,
    true,
    0,
    {
        if (!hasInterface) exitWith {};
        profileNamespace setVariable [QGVAR(showNewsOnMainMenu), _this];
    }
] call CBA_fnc_addSetting;
