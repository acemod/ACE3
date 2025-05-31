[
    QGVAR(enableFire),
    "CHECKBOX",
    [LSTRING(enableFire_name), LSTRING(enableFire_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cookoffDuration),
    "SLIDER",
    [LSTRING(cookoffDuration_name), LSTRING(cookoffDuration_tooltip)],
    LSTRING(category_displayName),
    [0, 10, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(probabilityCoef),
    "SLIDER",
    [LSTRING(probabilityCoef_name), LSTRING(probabilityCoef_tooltip)],
    LSTRING(category_displayName),
    [0, 10, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(destroyVehicleAfterCookoff),
    "CHECKBOX",
    [LSTRING(destroyVehicleAfterCookoff_name), LSTRING(destroyVehicleAfterCookoff_tooltip)],
    LSTRING(category_displayName),
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableAmmoCookoff),
    "CHECKBOX",
    [LSTRING(enableAmmoCookoff_name), LSTRING(enableAmmoCookoff_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableAmmobox),
    "CHECKBOX",
    [LSTRING(enableBoxCookoff_name), LSTRING(enableBoxCookoff_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCookoffDuration),
    "SLIDER",
    [LSTRING(ammoCookoffDuration_name), LSTRING(ammoCookoffDuration_tooltip)],
    LSTRING(category_displayName),
    [0, 10, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(removeAmmoDuringCookoff),
    "CHECKBOX",
    [LSTRING(removeAmmoDuringCookoff_name), LSTRING(removeAmmoDuringCookoff_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cookoffEnableProjectiles),
    "CHECKBOX",
    [LSTRING(enableProjectiles_name), LSTRING(enableProjectiles_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cookoffEnableSound),
    "CHECKBOX",
    [LSTRING(enableSound_name), LSTRING(enableSound_tooltip)],
    LSTRING(category_displayName),
    true,
    1
] call CBA_fnc_addSetting;
