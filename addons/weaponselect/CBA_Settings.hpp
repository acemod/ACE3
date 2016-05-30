
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(displayText): CBA_Setting_Boolean_base {
            displayName = CSTRING(SettingDisplayTextName);
            tooltip = CSTRING(SettingDisplayTextDesc);
            defaultValue = 1;
        };
    };
};
