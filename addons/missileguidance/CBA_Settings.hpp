
class CBA_Setting_List_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(enabled): CBA_Setting_List_base {
            displayName = CSTRING(Title);
            tooltip = CSTRING(Desc);
            values[] = {0,1,2};
            labels[] = {CSTRING(Off),CSTRING(PlayerOnly),CSTRING(PlayerAndAi)};
            defaultIndex = 2;
        };
    };
};