
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class PREFIX {
        class GVAR(enable): CBA_Setting_Boolean_base { // @todo
            displayName = CSTRING(enable);
            defaultValue = 1;
        };
        class GVAR(showInThirdPerson): CBA_Setting_Boolean_base {
            displayName = CSTRING(ShowInThirdPerson);
            defaultValue = 0;
        };
    };
};
