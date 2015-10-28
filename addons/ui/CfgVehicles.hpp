class CfgVehicles {
    class ACE_Module;

    // Basic
    class ACE_ModuleUI: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_UI_ca.paa));
        class Arguments {
            class soldierVehicleWeaponInfo {
                displayName = CSTRING(SoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleRadar {
                displayName = CSTRING(VehicleRadar);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleCompass {
                displayName = CSTRING(VehicleCompass);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class commandMenu {
                displayName = CSTRING(CommandMenu);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class groupBar {
                displayName = CSTRING(GroupBar);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };

    // Advanced
    class ACE_ModuleUI_Advanced: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleName_Advanced);
        function = QFUNC(moduleInitAdvanced);
        scope = 2;
        isGlobal = 1;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_UI_ca.paa));
        class Arguments {
            // Upper Weapon Info
            class weaponName {
                displayName = CSTRING(WeaponName);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponNameBackground {
                displayName = CSTRING(WeaponNameBackground);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class firingMode {
                displayName = CSTRING(FiringMode);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Lower Weapon Info
            class ammoType {
                displayName = CSTRING(AmmoType);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ammoCount {
                displayName = CSTRING(AmmoCount);
                description = CSTRING(AmmoCountDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class magCount {
                displayName = CSTRING(MagCount);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class grenadeFlareType {
                displayName = CSTRING(GrenadeFlareType);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class grenadeFlareCount {
                displayName = CSTRING(GrenadeFlareCount);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeroing {
                displayName = CSTRING(Zeroing);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponLowerInfoBackground {
                displayName = CSTRING(WeaponLowerInfoBackground);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Stance
            class stance {
                displayName = CSTRING(Stance);
                typeName = "BOOL";
                defaultValue = 1;
            };


            // Vehicle
            class vehicleName {
                displayName = CSTRING(VehicleName);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleNameBackground {
                displayName = CSTRING(VehicleNameBackground);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleFuelBar {
                displayName = CSTRING(VehicleFuelBar);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleSpeed {
                displayName = CSTRING(VehicleSpeed);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleAltitude {
                displayName = CSTRING(VehicleAltitude);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleDamage {
                displayName = CSTRING(VehicleDamage);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleInfoBackground {
                displayName = CSTRING(VehicleInfoBackground);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleGunnerWeapon {
                displayName = CSTRING(VehicleGunnerWeapon);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription_Advanced);
        };
    };
};
