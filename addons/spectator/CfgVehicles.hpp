class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleSpectator: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleSpectator);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Spectator_ca.paa);
        class Arguments {
            class SpectatorEnabled {
                displayName = CSTRING(Enabled_DisplayName);
                description = CSTRING(Enabled_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SpectatorPlayerSide {
                displayName = CSTRING(PlayerSide_DisplayName);
                description = CSTRING(PlayerSide_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SpectatorAI {
                displayName = CSTRING(AI_DisplayName);
                description = CSTRING(AI_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SpectatorTracking {
                displayName = CSTRING(Tracking_DisplayName);
                description = CSTRING(Tracking_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SpectatorPos {
                displayName = CSTRING(Pos_DisplayName);
                description = CSTRING(Pos_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SpectatorEnd {
                displayName = CSTRING(End_DisplayName);
                description = CSTRING(End_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
