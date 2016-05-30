
class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(optionMenuDisplaySize): CBA_Setting_List_base {
            displayName = CSTRING(uiScaing);
            values[] = {0,1,2};
            labels[] = {"$str_medium", "$str_large", "$str_very_large"};
            defaultIndex = 0;
        };
        class GVAR(showNewsOnMainMenu): CBA_Setting_Boolean_base {
            displayName = CSTRING(showNewsOnMainMenu_name);
            defaultIndex = 1;
        };
    };
};
