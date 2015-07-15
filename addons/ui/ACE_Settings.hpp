class ACE_Settings {
    class GVAR(weaponInfo) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(WeaponInfo);
    };
    class GVAR(weaponName) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(WeaponName);
    };
    /*class GVAR(ammoCount) { // Disabled in config by ace_reload
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(AmmoCount);
    };*/
    class GVAR(magCount) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MagCount);
    };
    class GVAR(grenadeName) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(GrenadeName);
    };
    class GVAR(grenadeCount) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(GrenadeCount);
    };
    class GVAR(zeroing) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(Zeroing);
    };
};
