class CfgAmmo {
    class MissileCore;
    class MissileBase : MissileCore {
        class Components;
    };
    class Missile_AGM_02_F : MissileBase {};
    
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

            minDeflection = 0;
            maxDeflection = 0.002;
            incDeflection = 0.001;

            canVanillaLock = 0;

            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL","LOBL"};

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

            minDeflection = 0;
            maxDeflection = 0.002;
            incDeflection = 0.001;

            canVanillaLock = 0;

            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};

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
