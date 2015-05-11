class CfgVehicles {
    class Module_F;
    class ModuleEmpty_F;
    class ACE_Module;

    class GVAR(moduleZeusSettings): ACE_Module {
        scope = 2;
        displayName = "Zeus Settings [ACE]";
        //icon = QUOTE(PATHTOF(iconGoesHere));
        category = "ACE_zeus";
        function = QUOTE(DFUNC(moduleZeusSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "SilentSpike";
        class Arguments {
            class zeusAscension {
                displayName = "Enable Ascension Messages";
                description = "Display a global popup message when a player is assigned as Zeus.";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeusBird {
                displayName = "Enable Eagle";
                description = "Spawn an eagle that follows the Zeus camera.";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class radioOrdnance {
                displayName = "Ordnance Radio Warning";
                description = "Play a radio warning when Zeus uses ordnance.";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class revealMines {
                displayName = "Reveal Mines";
                description = "Do you want to reveal mines placed by Zeus?";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class partial {
                        name = "Reveal to sides friendly with Zeus unit";
                        value = 1;
                    };
                    class full  {
                        name = "Add map markers and reveal to sides friendly with Zeus unit";
                        value = 2;
                        default = 1;
                    };
                };
            };
            class remoteWind {
                displayName = "Reveal Remote Control";
                description = "Play a wind sound when Zeus remote controls a unit.";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "Provides control over various aspects of Zeus.";
            sync[] = {};
        };
    };

    class ModuleCurator_F: Module_F {
        function = QUOTE(DFUNC(bi_moduleCurator));
    };
    class ModuleMine_F: ModuleEmpty_F {
        function = QUOTE(DFUNC(bi_moduleMine));
    };
    class ModuleOrdnance_F: Module_F {
        function = QUOTE(DFUNC(bi_moduleProjectile));
    };
    class ModuleRemoteControl_F: Module_F {
        function = QUOTE(DFUNC(bi_moduleRemoteControl));
    };
};