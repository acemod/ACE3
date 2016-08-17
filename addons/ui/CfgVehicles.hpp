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
            // Soldier
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
            class stance {
                displayName = CSTRING(Stance);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class staminaBar {
                displayName = CSTRING(StaminaBar);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Gunner
            class gunnerWeaponName {
                displayName = CSTRING(GunnerWeaponName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerWeaponNameBackground {
                displayName = CSTRING(GunnerWeaponNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerFiringMode {
                displayName = CSTRING(GunnerFiringMode);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerAmmoType {
                displayName = CSTRING(GunnerAmmoType);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerAmmoCount {
                displayName = CSTRING(GunnerAmmoCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerMagCount {
                displayName = CSTRING(GunnerMagCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerLaunchableName {
                displayName = CSTRING(gunnerLaunchableName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerLaunchableCount {
                displayName = CSTRING(gunnerLaunchableCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerZeroing {
                displayName = CSTRING(GunnerZeroing);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerWeaponLowerInfoBackground {
                displayName = CSTRING(GunnerWeaponLowerInfoBackground);
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
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
