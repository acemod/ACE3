
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class DOUBLES(PREFIX,OptionsMenu) {
        displayName = ECSTRING(OptionsMenu,CategoryLogistics); //@todo replace

        class GVAR(enable): CBA_Setting_Boolean_base {
            displayName = CSTRING(ModuleSettings_enable);
            tooltip = CSTRING(ModuleSettings_enable_Description);
            value = 1;
        };
    };
};
