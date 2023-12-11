class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleNameTags: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleNameTags);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_NameTags_ca.paa);
        class Arguments {
            class showPlayerNames {
                displayName = CSTRING(ShowPlayerNames);
                description = CSTRING(ShowPlayerNames_Desc);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = ECSTRING(common,DoNotForce);
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
                    class ForceShowFadeOnBorder {
                        name = CSTRING(FadeOnBorder);
                        value = 5;
                    };
                    class ForceShowOnlyCursor {
                        name = CSTRING(ForceShowOnlyCursor);
                        value = 2;
                    };
                    class ForceShowOnlyKeypress {
                        name = CSTRING(ForceShowOnlyKeypress);
                        value = 3;
                    };
                    class ForceShowOnlyCursorAndKeypress {
                        name = CSTRING(ForceShowOnlyCursorAndKeypress);
                        value = 4;
                    };
                };
            };
            class playerNamesViewDistance {
                displayName = CSTRING(playerNamesViewDistance_DisplayName);
                description = CSTRING(playerNamesViewDistance_Description);
                typeName = "NUMBER";
                defaultValue = 5;
            };
            class showNamesForAI {
                displayName = CSTRING(ShowNamesForAI);
                description = CSTRING(ShowNamesForAI_Desc);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = ECSTRING(common,DoNotForce);
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
                displayName = CSTRING(ShowVehicleCrewInfo);
                description = CSTRING(ShowVehicleCrewInfo_Desc);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = ECSTRING(common,DoNotForce);
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
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
