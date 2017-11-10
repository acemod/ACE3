class CfgVehicles {
    class ACE_Module;
    class GVAR(moduleSettings): ACE_Module {
        scope = 1;
        category = "ACE";
        displayName = CSTRING(moduleSettings_displayName);
        icon = QPATHTOF(UI\Icon_Module_finger_ca.paa);
        function = QFUNC(moduleSettings);
        isGlobal = 1;
        isSingular = 1;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_DisplayName);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class maxRange {
                displayName = CSTRING(maxRange_displayName);
                description = CSTRING(maxRange_description);
                typeName = "NUMBER";
                defaultValue = 4;
            };
        };
    };
};
