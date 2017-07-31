class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleMarkers: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(initModule);
        scope = 2;
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
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
