class EGVAR(missileguidance,type_RAM);
class EGVAR(missileguidance,type_Stinger);
class CfgAmmo {
    class ammo_Missile_rim116;
    class GVAR(rim116): ammo_Missile_rim116 {
        maneuvrability = 0;
        missileLockMaxSpeed = 2000;

        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        class ace_missileguidance: EGVAR(missileguidance,type_RAM) {
            enabled = 1;
        };
    };

    class M_70mm_SAAMI;
    class GVAR(stinger): M_70mm_SAAMI {
        maneuvrability = 0;
        missileLockMaxSpeed = 2000;

        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        class ace_missileguidance: EGVAR(missileguidance,type_Stinger) {
            enabled = 1;
        };
    };
};

