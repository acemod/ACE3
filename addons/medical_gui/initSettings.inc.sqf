[
    QGVAR(enableActions),
    "LIST",
    [LSTRING(EnableActions_DisplayName), LSTRING(EnableActions_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [[0, 1, 2], [LSTRING(Selections3D), LSTRING(Radial), ELSTRING(common,Disabled)], 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableSelfActions),
    "CHECKBOX",
    [LSTRING(EnableSelfActions_DisplayName), LSTRING(EnableSelfActions_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableMedicalMenu),
    "LIST",
    [LSTRING(EnableMedicalMenu_DisplayName), LSTRING(EnableMedicalMenu_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), ELSTRING(common,VehiclesOnly)], 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(openAfterTreatment),
    "CHECKBOX",
    [LSTRING(OpenAfterTreatment_DisplayName), LSTRING(OpenAfterTreatment_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(maxDistance),
    "SLIDER",
    [LSTRING(MaxDistance_DisplayName), LSTRING(MaxDistance_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [0, 10, 3, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(interactionMenuShowTriage),
    "LIST",
    [LSTRING(InteractionMenuShowTriage_DisplayName), LSTRING(InteractionMenuShowTriage_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(Medical_Treatment,Anyone), ELSTRING(Medical_Treatment,Medics)], 1],
    false
] call CBA_fnc_addSetting;

/*
* Default blood loss colouring follows a "white, yellow, red" colour scale with 10 steps, Bezier interpolation and Correct lightness gradient.
* See: https://gka.github.io/palettes
*/
private _bloodLossColors = [
    [0.00, 0.00, 0.00, 1],
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
    [0.00, 0.00, 0.00, 1],
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

private _categoryColors = [ELSTRING(medical,Interface_Category), format ["| %1 |", LELSTRING(common,subcategory_colors)]];
{
    [
        format ["%1_%2", QGVAR(bloodLossColor), _forEachIndex],
        "COLOR",
        [format [localize LSTRING(BloodLossColorX_DisplayName), _forEachIndex], LSTRING(BloodLossColor_Description)],
        _categoryColors,
        _x,
        false // isGlobal
    ] call CBA_fnc_addSetting;
} forEach _bloodLossColors;

{
    [
        format ["%1_%2", QGVAR(damageColor), _forEachIndex],
        "COLOR",
        [format [localize LSTRING(DamageColorX_DisplayName), _forEachIndex], LSTRING(DamageColor_Description)],
        _categoryColors,
        _x,
        false // isGlobal
    ] call CBA_fnc_addSetting;
} forEach _damageColors;

[
    QGVAR(showDamageEntry),
    "CHECKBOX",
    [LSTRING(showDamageEntry_DisplayName), LSTRING(showDamageEntry_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showBloodlossEntry),
    "CHECKBOX",
    [LSTRING(ShowBloodlossEntry_DisplayName), LSTRING(ShowBloodlossEntry_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    true,
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(showBleeding),
    "LIST",
    [LSTRING(showBleeding_DisplayName), LSTRING(showBleeding_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(ShowBleeding_Rate)], 2],
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bodyPartOutlineColor),
    "COLOR",
    [LSTRING(bodyPartOutlineColor_DisplayName), LSTRING(bodyPartOutlineColor_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [1.00, 1.00, 1.00, 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(peekMedicalInfoReleaseDelay),
    "TIME",
    [LSTRING(PeekMedicalInfoReleaseDelay_DisplayName), LSTRING(PeekMedicalInfoReleaseDelay_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [0, 5, 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(peekMedicalOnHit),
    "CHECKBOX",
    [LSTRING(PeekMedicalOnHit_DisplayName), LSTRING(PeekMedicalOnHit_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    false,
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(peekMedicalOnHitDuration),
    "TIME",
    [LSTRING(PeekMedicalOnHitDuration_DisplayName), LSTRING(PeekMedicalOnHitDuration_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    [0, 5, 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(tourniquetWarning),
    "CHECKBOX",
    [LSTRING(TourniquetWarning_DisplayName), LSTRING(TourniquetWarning_Description)],
    [ELSTRING(medical,Interface_Category), LSTRING(SubCategory)],
    false,
    false
] call CBA_fnc_addSetting;
