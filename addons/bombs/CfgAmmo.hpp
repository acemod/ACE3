class CfgAmmo {
    class LaserBombCore;
    class Bomb_04_F: LaserBombCore {
        laserLock = 0;
        class ADDON {
            enabled = 1;
            steeringAngle = 0.001;
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};
            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};
            seekerAngle = 30;
            seekerAccuracy = 1;
            seekerMinRange = 1;
            seekerMaxRange = 10000;
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
        class ace_missileguidance {
            steeringAngle = 0.001;
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};
            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};
            seekerAngle = 30;
            seekerAccuracy = 1;
            seekerMinRange = 1;
            seekerMaxRange = 10000;
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };
};