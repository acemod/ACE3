class CfgVehicles {
    class Module_F;
    class ModuleEmpty_F;
    class ACE_Module;

    class ModuleCurator_F: Module_F {
        function = QFUNC(bi_moduleCurator);
    };
    class ModuleMine_F: ModuleEmpty_F {
        function = QFUNC(bi_moduleMine);
    };
    class ModuleOrdnance_F: Module_F {
        function = QFUNC(bi_moduleProjectile);
    };
    class ModuleRemoteControl_F: Module_F {
        function = QFUNC(bi_moduleRemoteControl);
    };
    class GVAR(moduleSettings): ACE_Module {
        scope = 2;
        displayName = CSTRING(Settings_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Settings_ca.paa));
        category = "ACE";
        function = QFUNC(moduleZeusSettings);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "SilentSpike";
        class Arguments {
            class zeusAscension {
                displayName = CSTRING(ascension_DisplayName);
                description = CSTRING(ascension_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class zeusBird {
                displayName = CSTRING(bird_DisplayName);
                description = CSTRING(bird_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class remoteWind {
                displayName = CSTRING(remoteWind_DisplayName);
                description = CSTRING(remoteWind_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class radioOrdnance {
                displayName = CSTRING(radioOrdnance_DisplayName);
                description = CSTRING(radioOrdnance_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class revealMines {
                displayName = CSTRING(revealMines_DisplayName);
                description = CSTRING(revealMines_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "$STR_A3_OPTIONS_DISABLED";
                        value = 0;
                        default = 1;
                    };
                    class partial {
                        name = CSTRING(revealMines_partial);
                        value = 1;
                    };
                    class full  {
                        name = CSTRING(revealMines_full);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Settings_Description);
            sync[] = {};
        };
    };
    class GVAR(moduleBase): Module_F {
        author = "SilentSpike";
        category = "ACE";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        scope = 1;
        scopeCurator = 2;
    };
    class GVAR(moduleCaptive): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleCaptive_DisplayName);
        function = QFUNC(moduleCaptive);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Captive_ca.paa));
        class ModuleDescription {
            description = "Flips the capture state of the specified unit.";
            sync[] = {};
        };
    };
    class GVAR(moduleSurrender): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleSurrender_DisplayName);
        function = QFUNC(moduleSurrender);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Surrender_ca.paa));
        class ModuleDescription {
            description = "Flips the surrender state of the specified unit.";
            sync[] = {};
        };
    };
    class GVAR(moduleUnconscious): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleUnconscious_DisplayName);
        function = QFUNC(moduleUnconscious);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Unconscious_ca.paa));
        class ModuleDescription {
            description = "Flips the unconscious state of the specified unit.";
            sync[] = {};
        };
    };
    class GVAR(moduleSetMedic): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleSetMedic_DisplayName);
        function = QFUNC(moduleSetMedic);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa));
        class ModuleDescription {
            description = "";
            sync[] = {};
        };
    };
    class GVAR(moduleSetMedicalVehicle): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleSetMedicalVehicle_DisplayName);
        function = QFUNC(moduleSetMedicalVehicle);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa));
        class ModuleDescription {
            description = "";
            sync[] = {};
        };
    };
    class GVAR(moduleSetMedicalFacility): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleSetMedicalFacility_DisplayName);
        function = QFUNC(moduleSetMedicalFacility);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa));
        class ModuleDescription {
            description = "";
            sync[] = {};
        };
    };

    class GVAR(moduleAddSpareTrack): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleAddSpareTrack_DisplayName);
        function = QFUNC(moduleAddSpareTrack);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa));//@todo
        class ModuleDescription {
            description = CSTRING(ModuleAddSpareTrack_Description);
            sync[] = {};
        };
    };
    class GVAR(moduleAddSpareWheel): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleAddSpareWheel_DisplayName);
        function = QFUNC(moduleAddSpareWheel);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa));//@todo
        class ModuleDescription {
            description = CSTRING(ModuleAddSpareWheel_Description);
            sync[] = {};
        };
    };
};
