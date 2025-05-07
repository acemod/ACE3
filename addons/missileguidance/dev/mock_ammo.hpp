class M_Titan_AA_static;
class GVAR(mock_a_Malyutka): M_Titan_AA_static {
    aiAmmoUsageFlags = 64 + 128 + 256 + 512;
    weaponLockSystem = 0;
    airLock = 0;
    lockType = 0;
    manualControl = 0;
    thrust = 80;
    maxSpeed = 100;
    airFriction = 0.5;
    sideairfriction = 0.14;
    class ADDON: GVAR(type_Malyutka) {
        enabled = 1;
    };
};

class GVAR(mock_a_blowpipe): M_Titan_AA_static {
    aiAmmoUsageFlags = 64 + 128 + 256 + 512;
    weaponLockSystem = 0;
    airLock = 0;
    lockType = 0;
    manualControl = 0;
    thrust = 80;
    maxSpeed = 100;
    airFriction = 0.5;
    sideairfriction = 0.14;
    class ADDON: GVAR(type_Blowpipe) {
        enabled = 1;
    };
};
