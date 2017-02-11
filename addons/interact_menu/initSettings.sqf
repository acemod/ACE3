
[
    QGVAR(alwaysUseCursorSelfInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorSelfInteraction),
    LSTRING(Category_InteractionMenu),
    false
] call CBA_Settings_fnc_init;

[
    QGVAR(cursorKeepCentered),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    LSTRING(Category_InteractionMenu),
    false
] call CBA_Settings_fnc_init;

[
    QGVAR(alwaysUseCursorInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    LSTRING(Category_InteractionMenu),
    false
] call CBA_Settings_fnc_init;









/*

    class GVAR(useListMenu) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(UseListMenu);
    };




//

["ace_settingChanged", {
    params ["_name"];
    if (({_x == _name} count [QGVAR(colorTextMax), QGVAR(colorTextMin), QGVAR(colorShadowMax), QGVAR(colorShadowMin), QGVAR(textSize), QGVAR(shadowSetting)]) == 1) then {
        [] call FUNC(setupTextColors);
    };
}] call CBA_fnc_addEventHandler;


    class GVAR(colorTextMax) {
        value[] = {1, 1, 1, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(ColorTextMax);
    };
    class GVAR(colorTextMin) {
        value[] = {1, 1, 1, 0.25};
        typeName = "COLOR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(ColorTextMin);
    };
    class GVAR(colorShadowMax) {
        value[] = {0, 0, 0, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(ColorShadowMax);
    };
    class GVAR(colorShadowMin) {
        value[] = {0, 0, 0, 0.25};
        typeName = "COLOR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(ColorShadowMin);
    };
    class GVAR(textSize) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(textSize);
        values[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
    };



    class GVAR(shadowSetting) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(shadowSetting);
        description = CSTRING(shadowSettingDescription);
        values[] = {"$STR_A3_OPTIONS_DISABLED", "$STR_A3_OPTIONS_ENABLED", CSTRING(shadowOutline)};
    };
    class GVAR(actionOnKeyRelease) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(ActionOnKeyRelease);
    };
    class GVAR(menuBackground) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(background);
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(backgroundBlur), CSTRING(backgroundBlack)};
    };
    class GVAR(addBuildingActions) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(addBuildingActions);
        description = CSTRING(addBuildingActionsDescription);
    };
    class GVAR(menuAnimationSpeed) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = CSTRING(Category_InteractionMenu);
        displayName = CSTRING(menuAnimationSpeed);
        description = CSTRING(menuAnimationSpeed_Description);
        values[] = {"$str_speed_normal", "2x", "3x"};
    };
};

















