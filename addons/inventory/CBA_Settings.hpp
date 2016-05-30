
class CBA_Setting_List_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(inventoryDisplaySize): CBA_Setting_List_base {
            displayName = CSTRING(SettingName);
            tooltip = CSTRING(SettingDescription);
            values[] = {0,1,2};
            labels[] = {"$str_medium","$str_large","$str_very_large"};
            defaultIndex = 0;
        };
    };
};
