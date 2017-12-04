class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleMarkers: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(initModule);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_Markers_ca.paa);
        class Arguments {
            class MovableMarkersEnabled {
                displayName = CSTRING(MovableMarkers_DisplayName);
                description = CSTRING(MovableMarkers_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class MoveRestriction {
                displayName = CSTRING(MoveRestriction_DisplayName);
                description = CSTRING(MoveRestriction_Description);
                typeName = "NUMBER";
                class values {
                    class all {
                        name = CSTRING(MoveRestriction_All);
                        value = MOVE_RESTRICTION_ALL;
                        default = MOVE_RESTRICTION_ALL;
                    };
                    class admins {
                        name = CSTRING(MoveRestriction_Admins);
                        value = MOVE_RESTRICTION_ADMINS;
                    };
                    class groupLeaders {
                        name = CSTRING(MoveRestriction_GroupLeaders);
                        value = MOVE_RESTRICTION_GROUP_LEADERS;
                    };
                    class groupLeadersAndAdmins {
                        name = CSTRING(MoveRestriction_GroupLeadersAndAdmins);
                        value = MOVE_RESTRICTION_GROUP_LEADERS_ADMINS;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
