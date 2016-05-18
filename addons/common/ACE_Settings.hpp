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
    class GVAR(forceAllSettings) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(checkPBOsAction) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
        values[] = {CSTRING(CheckPBO_Action_WarnOnce), CSTRING(CheckPBO_Action_WarnPerm), CSTRING(CheckPBO_Action_Kick)};
    };
    class GVAR(checkPBOsCheckAll) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class GVAR(checkPBOsWhitelist) {
        value = "[]";
        typeName = "STRING";
        isClientSettable = 0;
    };
    /*class GVAR(enableNumberHotkeys) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(EnableNumberHotkeys);
    };*/
    class GVAR(settingFeedbackIcons) {
        value = 1;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = CSTRING(SettingFeedbackIconsName);
        description = CSTRING(SettingFeedbackIconsDesc);
        values[] = {ECSTRING(optionsmenu,Hide), ECSTRING(optionsmenu,TopRightDown), ECSTRING(optionsmenu,TopRightLeft), ECSTRING(optionsmenu,TopLeftDown), ECSTRING(optionsmenu,TopLeftRight)};
    };
    class GVAR(settingProgressBarLocation) {
        value = 0;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = CSTRING(SettingProgressbarLocationName);
        description = CSTRING(SettingProgressbarLocationDesc);
        values[] = {ECSTRING(optionsmenu,Top), ECSTRING(optionsmenu,Bottom)};
    };
    class GVAR(displayTextColor) {
        value[] = {0,0,0,0.1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(SettingDisplayTextColorName);
        description = CSTRING(SettingDisplayTextColorDesc);
    };
    class GVAR(displayTextFontColor) {
        value[] = {1,1,1,1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(SettingDisplayTextFontColorName);
        description = CSTRING(SettingDisplayTextFontColorDesc);
    };
};
