
class CBA_Setting_List_base;

class CBA_Settings {
    class GVARMAIN(OptionsMenu) {
        class GVAR(level): CBA_Setting_List_base {
            displayName = CSTRING(RearmSettings_level_DisplayName);
            tooltip = CSTRING(RearmSettings_level_Description);
            values[] = {0,1,2};
            labels[] = {CSTRING(RearmSettings_vehicle), CSTRING(RearmSettings_magazine), CSTRING(RearmSettings_caliber)};
            defaultIndex = 0;
        };
    };
};
