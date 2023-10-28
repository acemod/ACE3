class CfgAmmo {
    class MissileBase;
    class CUP_M_Javelin_AT: MissileBase {
        irLock = 1;
        laserLock = 0;
        airLock = 0;

        class ace_missileguidance {
            enabled = 1;
            minDeflection = 0.00005;
            maxDeflection = 0.025;
            incDeflection = 0.00005;
            canVanillaLock = 0;
            defaultSeekerType = "Optic";
            seekerTypes[] = {"Optic"};
            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = {"LOBL"};
            seekerAngle = 180;
            seekerAccuracy = 1;
            seekerMinRange = 0;
            seekerMaxRange = 2500;
            defaultAttackProfile = "JAV_TOP";
            attackProfiles[] = {"JAV_TOP", "JAV_DIR"};
        };
    };
};
