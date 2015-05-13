class ACE_Settings {
    /*
    *class GVAR(sampleSetting) {
    * Value
    *    value = 1;
    *
    * Type (SCALAR, BOOL, STRING, ARRAY, COLOR)
    *    typeName = "SCALAR";
    *
    * Force the setting?
    *    force = 0;
    *
    * Does it appear on the options menu?
    *    isClientSettable = 1;
    *
    * The following settings only apply when isClientSettable == 1
    * Stringtable entry with the setting name
    *    displayName = "$STR_ACE_Common_SettingName";
    *
    * Stringtable entry with the setting description
    *    description = "$STR_ACE_Common_SettingDescription";
    *
    * Stringtable entries that describe the options
    * Only applies if typeName == "SCALAR";
    *    values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"};
    *};
    */
    class GVAR(forceAllSettings) {
        value = 0;
        typeName = "BOOL";
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
        values[] = {"Hide", "Top right, downwards", "Top right, to the left", "Top left, downwards", "Top left, to the right"};
    };
    class GVAR(SettingProgressBarLocation) {
        value = 0;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingProgressbarLocationName";
        description = "$STR_ACE_Common_SettingProgressbarLocationDesc";
        values[] = {"Top", "Bottom"};
    };
    class GVAR(displayTextColor) {
        value[] = {0,0,0,0.1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingDisplayTextColorName";
        description = "$STR_ACE_Common_SettingDisplayTextColorDesc";
    };
    class GVAR(displayTextFontColor) {
        value[] = {1,1,1,1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Common_SettingDisplayTextFontColorName";
        description = "$STR_ACE_Common_SettingDisplayTextFontColorDesc";
    };
};
