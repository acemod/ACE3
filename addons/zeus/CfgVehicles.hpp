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
                displayName = "Ascension Messages";
                description = "Display global popup messages when a player is assigned as Zeus.";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeusBird {
                displayName = "Zeus Eagle";
                description = "Spawn an eagle that follows the Zeus camera.";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class remoteWind {
                displayName = "Wind Sounds";
                description = "Play wind sounds when Zeus remote controls a unit.";
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
                description = "Reveal mines to allies and/or place map markers.";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class partial {
                        name = "Reveal to Allies";
                        value = 1;
                    };
                    class full  {
                        name = "Allies + Map Markers";
                        value = 2;
                        default = 1;
                    };
                };
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