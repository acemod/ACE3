
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(savePreDeathGear): CBA_Setting_Boolean_base {
            displayName = CSTRING(SavePreDeathGear_DisplayName);
            tooltip = CSTRING(SavePreDeathGear_tooltip);
            defaultValue = 0;
        };
        class GVAR(removeDeadBodiesDisconnected): CBA_Setting_Boolean_base {
            displayName = CSTRING(RemoveDeadBodiesDisconnected_DisplayName);
            tooltip = CSTRING(RemoveDeadBodiesDisconnected_tooltip);
            defaultValue = 1;
        };
        class GVAR(bodyRemoveTimer): CBA_Setting_Slider_2_base {
            min = 0;
            max = 600;
            defaultValue = 0;
        };
    };
};
