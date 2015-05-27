class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ModuleDescription {};
    };
    class ACE_ModuleNameTags : Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleNameTags);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_NameTags_ca.paa));
        class Arguments {
            class PlayerNamesViewDistance {
                displayName = CSTRING(PlayerNamesViewDistance_DisplayName);
                description = CSTRING(PlayerNamesViewDistance_Description);
                typeName = "NUMBER";
                defaultValue = 5;
            };
            class showNamesForAI {
                displayName = CSTRING(showNamesForAI_DisplayName);
                description = CSTRING(showNamesForAI_Description);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = CSTRING(DoNotForce);
                        value = -1;
                    };
                    class ForceHide {
                        name = CSTRING(ForceHide);
                        value = 0;
                    };
                    class ForceShow {
                        name = CSTRING(ForceShow);
                        value = 1;
                    };
                };
            };
            class showVehicleCrewInfo {
                displayName = CSTRING(showVehicleCrewInfo_DisplayName);
                description = CSTRING(showVehicleCrewInfo_Description);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = CSTRING(DoNotForce);
                        value = -1;
                    };
                    class ForceHide {
                        name = CSTRING(ForceHide);
                        value = 0;
                    };
                    class ForceShow {
                        name = CSTRING(ForceShow);
                        value = 1;
                    };
                };
            };
            class showCursorTagForVehicles {
                displayName = CSTRING(showCursorTagForVehicles_DisplayName);
                description = CSTRING(showCursorTagForVehicles_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};