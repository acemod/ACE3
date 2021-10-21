[
    QGVAR(enableActions),
    "LIST",
    [LSTRING(EnableActions_DisplayName), LSTRING(EnableActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [LSTRING(Selections3D), LSTRING(Radial), ELSTRING(common,Disabled)], 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableSelfActions),
    "CHECKBOX",
    [LSTRING(EnableSelfActions_DisplayName), LSTRING(EnableSelfActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableMedicalMenu),
    "LIST",
    [LSTRING(EnableMedicalMenu_DisplayName), LSTRING(EnableMedicalMenu_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), ELSTRING(common,VehiclesOnly)], 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(openAfterTreatment),
    "CHECKBOX",
    [LSTRING(OpenAfterTreatment_DisplayName), LSTRING(OpenAfterTreatment_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(maxDistance),
    "SLIDER",
    [LSTRING(MaxDistance_DisplayName), LSTRING(MaxDistance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [0, 10, 3, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(interactionMenuShowTriage),
    "LIST",
    [LSTRING(InteractionMenuShowTriage_DisplayName), LSTRING(InteractionMenuShowTriage_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(Medical_Treatment,Anyone), ELSTRING(Medical_Treatment,Medics)], 1],
    false
] call CBA_fnc_addSetting;

/*
* Default blood loss colouring follows a "white, yellow, red" colour scale with 10 steps, Bezier interpolation and Correct lightness gradient.
* See: https://gka.github.io/palettes
*/
private _bloodLossColors = [
    [1.00, 1.00, 1.00, 1],
    [1.00, 0.95, 0.64, 1],
    [1.00, 0.87, 0.46, 1],
    [1.00, 0.80, 0.33, 1],
    [1.00, 0.72, 0.24, 1],
    [1.00, 0.63, 0.15, 1],
    [1.00, 0.54, 0.08, 1],
    [1.00, 0.43, 0.02, 1],
    [1.00, 0.30, 0.00, 1],
    [1.00, 0.00, 0.00, 1]
];

/*
* Default damage colouring follows a "white, cyan, blue" colour scale with 10 steps, Bezier interpolation and Correct lightness gradient.
* See: https://gka.github.io/palettes
*/
private _damageColors = [
    [1.00, 1.00, 1.00, 1],
    [0.75, 0.95, 1.00, 1],
    [0.62, 0.86, 1.00, 1],
    [0.54, 0.77, 1.00, 1],
    [0.48, 0.67, 1.00, 1],
    [0.42, 0.57, 1.00, 1],
    [0.37, 0.47, 1.00, 1],
    [0.31, 0.36, 1.00, 1],
    [0.22, 0.23, 1.00, 1],
    [0.00, 0.00, 1.00, 1]
];

{
    [
        format ["%1_%2", QGVAR(bloodLossColor), _forEachIndex], 
        "COLOR",
        [format [localize LSTRING(BloodLossColorX_DisplayName), _forEachIndex], LSTRING(BloodLossColor_Description)],
        [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
        _x,
        false // isGlobal
    ] call CBA_fnc_addSetting;
} forEach _bloodLossColors;

{
    [
        format ["%1_%2", QGVAR(damageColor), _forEachIndex],
        "COLOR",
        [format [localize LSTRING(DamageColorX_DisplayName), _forEachIndex], LSTRING(DamageColor_Description)],
        [ELSTRING(medical,Category), LSTRING(DamageColors)],
        _x,
        false // isGlobal
    ] call CBA_fnc_addSetting;
} forEach _damageColors;
