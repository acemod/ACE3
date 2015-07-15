class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleUI: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_UI_ca.paa));
        class Arguments {
            class weaponInfo {
                displayName = CSTRING(WeaponInfo);
                description = CSTRING(WeaponInfoDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponName {
                displayName = CSTRING(WeaponName);
                description = CSTRING(WeaponNameDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            /*class ammoCount { // Disabled in config by ace_reload
                displayName = CSTRING(AmmoCount);
                description = CSTRING(AmmoCountDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };*/
            class magCount {
                displayName = CSTRING(MagCount);
                description = CSTRING(MagCountDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class grenadeName {
                displayName = CSTRING(GrenadeName);
                description = CSTRING(GrenadeNameDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class grenadeCount {
                displayName = CSTRING(GrenadeCount);
                description = CSTRING(GrenadeCountDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeroing {
                displayName = CSTRING(Zeroing);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
