
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(enable): CBA_Setting_Boolean_base {
            displayName = CSTRING(Enable);
            defaultValue = 0;
        };
    };
};
