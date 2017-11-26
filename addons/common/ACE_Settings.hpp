class ACE_Settings {
    /*
     * class GVAR(sampleSetting) {
     *     value = 1; // Value
     *     typeName = "SCALAR"; // Type (SCALAR, BOOL, STRING, ARRAY, COLOR)
     *     force = 0; // Force the setting?
     *     isClientSettable = 1; // Does it appear on the options menu?
     *
     *     // The following settings only apply when isClientSettable == 1
     *     displayName = "$STR_ACE_Common_SettingName"; // Stringtable entry with the setting name
     *     description = "$STR_ACE_Common_SettingDescription"; // Stringtable entry with the setting description
     *
     *     // Only applies if typeName == "SCALAR";
     *     values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"}; // Stringtable entries that describe the options
     * };
     */
    class GVAR(checkPBOsAction) {
        category = CSTRING(DisplayName);
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
        displayName = CSTRING(CheckPBOsAction);
        values[] = {CSTRING(CheckPBO_Action_WarnOnce), CSTRING(CheckPBO_Action_WarnPerm), CSTRING(CheckPBO_Action_Kick)};
    };
    class GVAR(checkPBOsCheckAll) {
        category = CSTRING(DisplayName);
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
        displayName = CSTRING(CheckPBOsCheckAll);
    };
    class GVAR(checkPBOsWhitelist) {
        category = CSTRING(DisplayName);
        value = "[]";
        typeName = "STRING";
        isClientSettable = 0;
        displayName = CSTRING(CheckPBOsWhitelist);
    };
    /*class GVAR(enableNumberHotkeys) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(EnableNumberHotkeys);
    };*/
    class GVAR(settingFeedbackIcons) {
        category = CSTRING(DisplayName);
        value = 1;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = CSTRING(SettingFeedbackIconsName);
        description = CSTRING(SettingFeedbackIconsDesc);
        values[] = {ECSTRING(optionsmenu,Hide), ECSTRING(optionsmenu,TopRightDown), ECSTRING(optionsmenu,TopRightLeft), ECSTRING(optionsmenu,TopLeftDown), ECSTRING(optionsmenu,TopLeftRight)};
    };
    class GVAR(settingProgressBarLocation) {
        category = CSTRING(DisplayName);
        value = 0;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = CSTRING(SettingProgressbarLocationName);
        description = CSTRING(SettingProgressbarLocationDesc);
        values[] = {ECSTRING(optionsmenu,Top), ECSTRING(optionsmenu,Bottom)};
    };
    class GVAR(displayTextColor) {
        category = CSTRING(DisplayName);
        value[] = {0,0,0,0.1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(SettingDisplayTextColorName);
        description = CSTRING(SettingDisplayTextColorDesc);
    };
    class GVAR(displayTextFontColor) {
        category = CSTRING(DisplayName);
        value[] = {1,1,1,1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(SettingDisplayTextFontColorName);
        description = CSTRING(SettingDisplayTextFontColorDesc);
    };
};
