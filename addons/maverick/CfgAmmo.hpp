class CfgAmmo {
    class MissileCore;
    class MissileBase : MissileCore {
        class Components;
    };
    class Missile_AGM_02_F : MissileBase {};

    class GVAR(D): Missile_AGM_02_F {
        author = "Brandon (TCVM)";
        missileLockMaxDistance = 14000;
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 15;
            yawRate = 15;

            canVanillaLock = 1;

            defaultSeekerType = "Optic";
            seekerTypes[] = {"Optic"};

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = {"LOBL"};

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 1;
            seekerAngle = 60;
            seekerAccuracy = 1;

            seekerMinRange = 1;
            seekerMaxRange = 14000;

            defaultAttackProfile = "maverick";
            attackProfiles[] = {"maverick"};
        };
    };

    class GVAR(G): GVAR(D) {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };

    class GVAR(L) : Missile_AGM_02_F {
        author = "xrufix";
        autoSeekTarget = 0;
        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        missileLockMaxDistance = 16000;
        weaponLockSystem = 4;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 15;
            yawRate = 15;

            canVanillaLock = 0;

            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL","LOBL"};

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 1;
            seekerAngle = 60;
            seekerAccuracy = 1;

            seekerMinRange = 1;
            seekerMaxRange = 16000;

            defaultAttackProfile = "maverick";
            attackProfiles[] = {"maverick"};
        };
    };

    class Missile_AGM_01_F: Missile_AGM_02_F {};
    class ace_kh25ml: Missile_AGM_01_F {
        author = "xrufix";
        irLock = 0;
        missileLockMaxDistance = 10000;
        weaponLockSystem = 4;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 20;
            yawRate = 20;

            canVanillaLock = 0;

            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 1;
            seekerAngle = 40;
            seekerAccuracy = 1;

            seekerMinRange = 1;
            seekerMaxRange = 10000;

            defaultAttackProfile = "maverick";
            attackProfiles[] = {"maverick"};
        };
    };
};
