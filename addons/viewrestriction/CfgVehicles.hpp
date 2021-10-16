#define MACRO_OPTIONS \
    class Disabled { \
        default = 1; \
        name = CSTRING(Disabled); \
        value = 0; \
    }; \
    class FirstPerson { \
        name = CSTRING(FirstPerson); \
        value = 1; \
    }; \
    class ThirdPerson { \
        name = CSTRING(ThirdPerson); \
        value = 2; \
    };

class CfgVehicles {
    class ACE_Module;
    class XGVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACEX";
        function = QFUNC(moduleInit);
        displayName = CSTRING(ModuleDisplayName);
        scope = 1;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_ViewRestriction_ca.paa));
        class Arguments {
            class mode {
                displayName = CSTRING(Mode);
                description = CSTRING(ModeDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                    class Selective {
                        name = CSTRING(Selective);
                        value = 3;
                    };
                };
            };
            class modeSelectiveFoot {
                displayName = CSTRING(ModeSelectiveFoot);
                description = CSTRING(ModeSelectiveFootDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                };
            };
            class modeSelectiveLand {
                displayName = CSTRING(ModeSelectiveLand);
                description = CSTRING(ModeSelectiveLandDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                };
            };
            class modeSelectiveAir {
                displayName = CSTRING(ModeSelectiveAir);
                description = CSTRING(ModeSelectiveAirDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                };
            };
            class modeSelectiveSea {
                displayName = CSTRING(ModeSelectiveSea);
                description = CSTRING(ModeSelectiveSeaDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                };
            };
            // Disabled - Reference comment in FUNC(canChangeCamera)
            /*class modeSelectiveUAV {
                displayName = CSTRING(ModeSelectiveUAV);
                description = CSTRING(ModeSelectiveUAVDesc);
                typeName = "NUMBER";
                class values {
                    MACRO_OPTIONS
                };
            };*/
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
