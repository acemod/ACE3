private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(allowHandcuffOwnSide), "CHECKBOX",
    [LSTRING(ModuleSettings_handcuffSide_name), LSTRING(ModuleSettings_handcuffSide_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireSurrender), "LIST",
    [LSTRING(ModuleSettings_requireSurrender_name), LSTRING(ModuleSettings_requireSurrender_description)],
    _category,
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(SurrenderOnly), LSTRING(SurrenderOrNoWeapon)], 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(allowSurrender), "CHECKBOX",
    [LSTRING(ModuleSettings_allowSurrender_name), LSTRING(ModuleSettings_allowSurrender_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireSurrenderAi), "CHECKBOX",
    [LSTRING(ModuleSettings_requireSurrenderAi_name), LSTRING(ModuleSettings_requireSurrenderAi_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
