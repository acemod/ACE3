class ace_missileguidance_type_Maverick;
class CfgAmmo {
    class Missile_AGM_02_F;

    class GVAR(D): Missile_AGM_02_F {
        author = "tcvm";
        missileLockMaxDistance = 14000;
        maneuvrability = 0;
        class ace_missileguidance: ace_missileguidance_type_Maverick {
            enabled = 1;
        };
    };

    class GVAR(G): GVAR(D) {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };

    class GVAR(L): Missile_AGM_02_F {
        author = "xrufix";
        autoSeekTarget = 0;
        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        missileLockMaxDistance = 16000;
        weaponLockSystem = 4;
        class ace_missileguidance: ace_missileguidance_type_Maverick {
            enabled = 1;
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};

            seekerMaxRange = 16000;
        };
    };

    class Missile_AGM_01_F: Missile_AGM_02_F {};
    class ace_kh25ml: Missile_AGM_01_F {
        author = "xrufix";
        irLock = 0;
        missileLockMaxDistance = 10000;
        weaponLockSystem = 4;
        class ace_missileguidance: ace_missileguidance_type_Maverick {
            enabled = 1;
            pitchRate = 20;
            yawRate = 20;

            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};

            seekerAngle = 40;
            seekerMaxRange = 10000;
        };
    };
};
