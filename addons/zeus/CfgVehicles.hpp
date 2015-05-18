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
    class GVAR(moduleZeusSettings): ACE_Module {
        scope = 2;
        displayName = "$STR_ACE_Zeus_Module_DisplayName";
        //icon = QUOTE(PATHTOF(iconGoesHere));
        category = "ACE_zeus";
        function = QFUNC(moduleZeusSettings);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "SilentSpike";
        class Arguments {
            class zeusAscension {
                displayName = "$STR_ACE_Zeus_ascension_DisplayName";
                description = "$STR_ACE_Zeus_ascension_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class zeusBird {
                displayName = "$STR_ACE_Zeus_bird_DisplayName";
                description = "$STR_ACE_Zeus_bird_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class remoteWind {
                displayName = "$STR_ACE_Zeus_remoteWind_DisplayName";
                description = "$STR_ACE_Zeus_remoteWind_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class radioOrdnance {
                displayName = "$STR_ACE_Zeus_radioOrdnance_DisplayName";
                description = "$STR_ACE_Zeus_radioOrdnance_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class revealMines {
                displayName = "$STR_ACE_Zeus_revealMines_DisplayName";
                description = "$STR_ACE_Zeus_revealMines_Description";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "$STR_ACE_Zeus_revealMines_disable";
                        value = 0;
                        default = 1;
                    };
                    class partial {
                        name = "$STR_ACE_Zeus_revealMines_partial";
                        value = 1;
                    };
                    class full  {
                        name = "$STR_ACE_Zeus_revealMines_full";
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_Zeus_Module_Description";
            sync[] = {};
        };
    };
    class GVAR(moduleBase): Module_F {
        author = "SilentSpike";
        category = "ACE_zeus";
        scopeCurator = 2;
    };
    class GVAR(moduleKnockout): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = "Knockout/Wakeup Unit";
        function = QFUNC(moduleKnockout);
        class ModuleDescription {
            description = "Flips the unconscious state of the specified unit.";
            sync[] = {};
        };
    };
    class GVAR(moduleSurrender): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = "Force Surrender";
        function = QFUNC(moduleSurrender);
        class ModuleDescription {
            description = "Flips the surrender state of the specified unit.";
            sync[] = {};
        };
    };
};
