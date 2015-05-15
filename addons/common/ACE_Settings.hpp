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
        values[] = {"$STR_ACE_Common_CheckPBO_Action_WarnOnce", "$STR_ACE_Common_CheckPBO_Action_WarnPerm", "$STR_ACE_Common_CheckPBO_Action_Kick"};
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
        displayName = "$STR_ACE_Common_EnableNumberHotkeys";
    };*/
    class GVAR(settingFeedbackIcons) {
        value = 1;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingFeedbackIconsName";
        description = "$STR_ACE_Common_SettingFeedbackIconsDesc";
        values[] = {"$STR_ACE_Common_Hide", "$STR_ACE_Common_TopRightDown", "$STR_ACE_Common_TopRightLeft", "$STR_ACE_Common_TopLeftDown", "$STR_ACE_Common_TopLeftRight"};
    };
    class GVAR(SettingProgressBarLocation) {
        value = 0;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingProgressbarLocationName";
        description = "$STR_ACE_Common_SettingProgressbarLocationDesc";
        values[] = {"$STR_ACE_Common_Top", "$STR_ACE_Common_Bottom"};
    };
    class GVAR(displayTextColor) {
        value[] = {0, 0, 0, 0.1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingDisplayTextColorName";
        description = "$STR_ACE_Common_SettingDisplayTextColorDesc";
    };
    class GVAR(displayTextFontColor) {
        value[] = {1, 1, 1, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingDisplayTextFontColorName";
        description = "$STR_ACE_Common_SettingDisplayTextFontColorDesc";
    };
};
