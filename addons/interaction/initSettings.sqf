
[
    QGVAR(enableTeamManagement),
    "CHECKBOX",
    [LSTRING(EnableTeamManagement_DisplayName), LSTRING(EnableTeamManagement_Description)],
    ELSTRING(interact_menu,Category_InteractionMenu),
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enableMagazinePassing),
    "CHECKBOX",
    LSTRING(PassMagazineSetting),
    ELSTRING(interact_menu,Category_InteractionMenu),
    true
] call CBA_Settings_fnc_init;
