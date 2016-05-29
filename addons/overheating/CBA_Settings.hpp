
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(displayTextOnJam): CBA_Setting_Boolean_base {
            displayName = CSTRING(DisplayTextOnJam_displayName);
            tooltip = CSTRING(DisplayTextOnJam_tooltip);
            defaultValue = 1;
        };
        class GVAR(showParticleEffects): CBA_Setting_Boolean_base {
            displayName = CSTRING(showParticleEffects_displayName);
            tooltip = CSTRING(showParticleEffects_tooltip);
            defaultValue = 1;
        };
        class GVAR(showParticleEffectsForEveryone): CBA_Setting_Boolean_base {
            displayName = CSTRING(showParticleEffectsForEveryone_displayName);
            tooltip = CSTRING(showParticleEffectsForEveryone_tooltip);
            defaultValue = 0;
        };
        class GVAR(overheatingDispersion): CBA_Setting_Boolean_base {
            displayName = CSTRING(overheatingDispersion_displayName);
            tooltip = CSTRING(overheatingDispersion_tooltip);
            defaultValue = 1;
        };
        class GVAR(unJamOnreload): CBA_Setting_Boolean_base {
            displayName = CSTRING(unJamOnreload_displayName);
            tooltip = CSTRING(unJamOnreload_tooltip);
            defaultValue = 0;
        };
        class GVAR(unJamFailChance): CBA_Setting_Slider_2_base {
            displayName = CSTRING(unJamFailChance_displayName);
            tooltip = CSTRING(unJamFailChance_tooltip);
            defaultValue = 0.1;
        };
        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabled_displayName);
            tooltip = CSTRING(enabled_tooltip);
            defaultValue = 1;
        };
    };
};
