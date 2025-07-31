class M_Titan_AA_static;
class GVAR(mock_a_Malyutka): M_Titan_AA_static {
    aiAmmoUsageFlags = 64 + 128 + 256 + 512;
    weaponLockSystem = 0;
    airLock = 0;
    lockType = 0;
    manualControl = 0;
    thrust = 80;
    maxSpeed = 100;
    airFriction = 0.01;
    sideairfriction = 0.5;
    maneuvrability = 0;
    class ADDON: GVAR(type_Malyutka) {
        pitchRate = 5;          // Minium flap deflection for guidance
        yawRate = 5;            // Maximum flap deflection for guidance
        enabled = 1;
    };
};

class GVAR(mock_a_blowpipe): M_Titan_AA_static {
    aiAmmoUsageFlags = 64 + 128 + 256 + 512;
    weaponLockSystem = 0;
    airLock = 0;
    lockType = 0;
    manualControl = 0;
    thrust = 120;
    maxSpeed = 500;
    timeToLive = 15;
    thrustTime = 15;
    airFriction = 0.01;
    sideairfriction = 0.5;
    maneuvrability = 0;
    class ADDON: GVAR(type_Blowpipe) {
        pitchRate = 5;          // Minium flap deflection for guidance
        yawRate = 5;            // Maximum flap deflection for guidance
        enabled = 1;
    };
};
