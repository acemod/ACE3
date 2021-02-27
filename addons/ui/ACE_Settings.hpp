class ACE_Settings {
    class GVAR(allowSelectiveUI) {
        category = CSTRING(Category);
        displayName = CSTRING(AllowSelectiveUI);
        description = CSTRING(AllowSelectiveUI_Description);
        typeName = "BOOL";
        value = 1;
    };

// BASIC
    class GVAR(soldierVehicleWeaponInfo) {
        category = CSTRING(Category);
        displayName = CSTRING(SoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleRadar) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleRadar);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleCompass) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleCompass);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(commandMenu) {
        category = CSTRING(Category);
        displayName = CSTRING(CommandMenu);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(groupBar) {
        category = CSTRING(Category);
        displayName = CSTRING(GroupBar);
        typeName = "BOOL";
        value = 0;
        isClientSettable = 1;
    };

// ADVANCED
    // Soldier
    class GVAR(weaponName) {
        category = CSTRING(Category);
        displayName = CSTRING(WeaponName);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(weaponNameBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(WeaponNameBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(firingMode) {
        category = CSTRING(Category);
        displayName = CSTRING(FiringMode);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(ammoType) {
        category = CSTRING(Category);
        displayName = CSTRING(AmmoType);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(ammoCount) {
        category = CSTRING(Category);
        displayName = CSTRING(AmmoCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 0;
        isClientSettable = 1;
    };
    class GVAR(magCount) {
        category = CSTRING(Category);
        displayName = CSTRING(MagCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(throwableName) {
        category = CSTRING(Category);
        displayName = CSTRING(throwableName);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(throwableCount) {
        category = CSTRING(Category);
        displayName = CSTRING(throwableCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(zeroing) {
        category = CSTRING(Category);
        displayName = CSTRING(Zeroing);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(weaponLowerInfoBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(WeaponLowerInfoBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(stance) {
        category = CSTRING(Category);
        displayName = CSTRING(Stance);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(staminaBar) {
        category = CSTRING(Category);
        displayName = CSTRING(StaminaBar);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };

    // Gunner
    class GVAR(gunnerWeaponName) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerWeaponName);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerWeaponNameBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerWeaponNameBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerFiringMode) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerFiringMode);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerAmmoType) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerAmmoType);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerAmmoCount) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerAmmoCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerMagCount) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerMagCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerLaunchableName) {
        category = CSTRING(Category);
        displayName = CSTRING(gunnerLaunchableName);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerLaunchableCount) {
        category = CSTRING(Category);
        displayName = CSTRING(gunnerLaunchableCount);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerZeroing) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerZeroing);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(gunnerWeaponLowerInfoBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(GunnerWeaponLowerInfoBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };

    // Vehicle
    class GVAR(vehicleName) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleName);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleNameBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleNameBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleFuelBar) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleFuelBar);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleSpeed) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleSpeed);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleAltitude) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleAltitude);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleDamage) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleDamage);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(vehicleInfoBackground) {
        category = CSTRING(Category);
        displayName = CSTRING(VehicleInfoBackground);
        description = CSTRING(RequiresSoldierVehicleWeaponInfo);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
};
