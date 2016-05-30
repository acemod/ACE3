
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);
        class GVAR(enableCombatDeafness): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableCombatDeafness_DisplayName);
            tooltip = CSTRING(EnableCombatDeafness_Description);
            defaultValue = 1;
        };
        class GVAR(earplugsVolume): CBA_Setting_Slider_2_base {
            defaultValue = 0.5;
            serverOnly = 1;
        };
        class GVAR(unconsciousnessVolume): CBA_Setting_Slider_2_base {
            defaultValue = 0.4;
            serverOnly = 1;
        };
        class GVAR(disableEarRinging): CBA_Setting_Boolean_base {
            displayName = CSTRING(DisableEarRinging_DisplayName);
            tooltip = CSTRING(DisableEarRinging_Description);
            defaultValue = 0;
        };
        class GVAR(enabledForZeusUnits): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabledForZeusUnits_DisplayName);
            tooltip = CSTRING(enabledForZeusUnits_Description);
            defaultValue = 1;
        };
        class GVAR(autoAddEarplugsToUnits): CBA_Setting_Boolean_base {
            displayName = CSTRING(autoAddEarplugsToUnits_DisplayName);
            tooltip = CSTRING(autoAddEarplugsToUnits_Description);
            defaultValue = 1;
            serverOnly = 1;
        };
    };
};
