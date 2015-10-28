class ACE_Settings {
// BASIC
    class GVAR(soldierVehicleWeaponInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(SoldierVehicleWeaponInfo);
        category = CSTRING(Category);
    };
    class GVAR(vehicleRadar) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleRadar);
        category = CSTRING(Category);
    };
    class GVAR(vehicleCompass) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleCompass);
        category = CSTRING(Category);
    };
    class GVAR(commandMenu) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(CommandMenu);
        category = CSTRING(Category);
    };
    class GVAR(groupBar) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(GroupBar);
        category = CSTRING(Category);
    };

// ADVANCED
    // Upper Weapon Info
    class GVAR(weaponName) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(WeaponName);
        category = CSTRING(Category);
    };
    class GVAR(weaponNameBackground) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(WeaponNameBackground);
        category = CSTRING(Category);
    };
    class GVAR(firingMode) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(FiringMode);
        category = CSTRING(Category);
    };

    // Lower Weapon Info
    class GVAR(ammoType) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(AmmoType);
        category = CSTRING(Category);
    };
    class GVAR(ammoCount) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(AmmoCount);
        description = CSTRING(AmmoCountDesc);
        category = CSTRING(Category);
    };
    class GVAR(magCount) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(MagCount);
        category = CSTRING(Category);
    };
    class GVAR(grenadeFlareType) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(GrenadeFlareType);
        category = CSTRING(Category);
    };
    class GVAR(grenadeFlareCount) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(GrenadeFlareCount);
        category = CSTRING(Category);
    };
    class GVAR(zeroing) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Zeroing);
        category = CSTRING(Category);
    };
    class GVAR(weaponLowerInfoBackground) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(WeaponLowerInfoBackground); //todo
        category = CSTRING(Category);
    };

    // Stance
    class GVAR(stance) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Stance);
        category = CSTRING(Category);
    };


    // Vehicle
    class GVAR(vehicleName) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleName);
        category = CSTRING(Category);
    };
    class GVAR(vehicleNameBackground) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleNameBackground);
        category = CSTRING(Category);
    };
    class GVAR(vehicleFuelBar) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleFuelBar);
        category = CSTRING(Category);
    };
    class GVAR(vehicleSpeed) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleSpeed);
        category = CSTRING(Category);
    };
    class GVAR(vehicleAltitude) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleAltitude);
        category = CSTRING(Category);
    };
    class GVAR(vehicleDamage) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleDamage);
        category = CSTRING(Category);
    };
    class GVAR(vehicleInfoBackground) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleInfoBackground);
        category = CSTRING(Category);
    };
    class GVAR(vehicleGunnerWeapon) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(VehicleGunnerWeapon);
        category = CSTRING(Category);
    };
};
