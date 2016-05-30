
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(disableNVGsWithSights): CBA_Setting_Boolean_base {
            displayName = CSTRING(DisableNVGsWithSights_DisplayName);
            tooltip = CSTRING(DisableNVGsWithSights_description);
            defaultValue = 0;
        };
    };
};
