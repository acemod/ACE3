class CfgVehicles {
    class ACE_Module;
    class GVAR(moduleSettings): ACE_Module {
        scope = 2;
        category = "ACE";
        displayName = CSTRING(moduleSettings_displayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_finger_ca.paa));
        function = QFUNC(moduleSettings);
        isGlobal = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class maxRange {
                displayName = CSTRING(maxRange_displayName);
                description = CSTRING(maxRange_description);
                typeName = "NUMBER";
                defaultValue = 4;
            };
        };
    };
};
