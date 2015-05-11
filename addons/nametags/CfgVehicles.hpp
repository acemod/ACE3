class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ModuleDescription {};
    };
    class ACE_ModuleNameTags : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_NameTags_Module_DisplayName";
        function = QFUNC(moduleNameTags);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_NameTags_ca.paa));
        class Arguments {
            class PlayerNamesViewDistance {
                displayName = "$STR_ACE_NameTags_PlayerNamesViewDistance_DisplayName";
                description = "$STR_ACE_NameTags_PlayerNamesViewDistance_Description";
                typeName = "NUMBER";
                defaultValue = 5;
            };
            class showNamesForAI {
                displayName = "$STR_ACE_NameTags_showNamesForAI_DisplayName";
                description = "$STR_ACE_NameTags_showNamesForAI_Description";
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = "$STR_ACE_NameTags_DoNotForce";
                        value = -1;
                    };
                    class ForceHide {
                        name = "$STR_ACE_NameTags_ForceHide";
                        value = 0;
                    };
                    class ForceShow {
                        name = "$STR_ACE_NameTags_ForceShow";
                        value = 1;
                    };
                };
            };
            class showVehicleCrewInfo {
                displayName = "$STR_ACE_NameTags_showVehicleCrewInfo_DisplayName";
                description = "$STR_ACE_NameTags_showVehicleCrewInfo_Description";
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = "$STR_ACE_NameTags_DoNotForce";
                        value = -1;
                    };
                    class ForceHide {
                        name = "$STR_ACE_NameTags_ForceHide";
                        value = 0;
                    };
                    class ForceShow {
                        name = "$STR_ACE_NameTags_ForceShow";
                        value = 1;
                    };
                };
            };
            class showCursorTagForVehicles {
                displayName = "$STR_ACE_NameTags_showCursorTagForVehicles_DisplayName";
                description = "$STR_ACE_NameTags_showCursorTagForVehicles_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "$STR_ACE_NameTags_Module_Description";
        };
    };
};