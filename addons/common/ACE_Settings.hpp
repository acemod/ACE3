class ACE_Settings {
    //IGNORE_STRING_WARNING(STR_ACE_Common_SettingName);
    //IGNORE_STRING_WARNING(STR_ACE_Common_SettingDescription);
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
        movedToSQF = 1;
    };
    class GVAR(checkPBOsCheckAll) {
        movedToSQF = 1;
    };
    class GVAR(checkPBOsWhitelist) {
        movedToSQF = 1;
    };
    /*class GVAR(enableNumberHotkeys) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(EnableNumberHotkeys);
    };*/
    class GVAR(settingFeedbackIcons) {
        movedToSQF = 1;
    };
    class GVAR(settingProgressBarLocation) {
        movedToSQF = 1;
    };
    class GVAR(displayTextColor) {
        movedToSQF = 1;
    };
    class GVAR(displayTextFontColor) {
        movedToSQF = 1;
    };
};
