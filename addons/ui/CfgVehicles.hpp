class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_UI_ca.paa));
        class Arguments {
            class allowSelectiveUI {
                displayName = CSTRING(AllowSelectiveUI);
                description = CSTRING(AllowSelectiveUI_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // BASIC
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
                defaultValue = 0;
            };

            // ADVANCED
            // Upper Weapon Info
            class weaponName {
                displayName = CSTRING(WeaponName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponNameBackground {
                displayName = CSTRING(WeaponNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class firingMode {
                displayName = CSTRING(FiringMode);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Lower Weapon Info
            class ammoType {
                displayName = CSTRING(AmmoType);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ammoCount {
                displayName = CSTRING(AmmoCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class magCount {
                displayName = CSTRING(MagCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class throwableName {
                displayName = CSTRING(throwableName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class throwableCount {
                displayName = CSTRING(throwableCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeroing {
                displayName = CSTRING(Zeroing);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponLowerInfoBackground {
                displayName = CSTRING(WeaponLowerInfoBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Stance
            class stance {
                displayName = CSTRING(Stance);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Stamina Bar
            class staminaBar {
                displayName = CSTRING(StaminaBar);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Vehicle
            class vehicleName {
                displayName = CSTRING(VehicleName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleNameBackground {
                displayName = CSTRING(VehicleNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleFuelBar {
                displayName = CSTRING(VehicleFuelBar);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleSpeed {
                displayName = CSTRING(VehicleSpeed);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleAltitude {
                displayName = CSTRING(VehicleAltitude);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleDamage {
                displayName = CSTRING(VehicleDamage);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleInfoBackground {
                displayName = CSTRING(VehicleInfoBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleGunnerWeapon {
                displayName = CSTRING(VehicleGunnerWeapon);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
