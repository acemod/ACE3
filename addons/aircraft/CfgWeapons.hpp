class Mode_FullAuto;

class CfgWeapons {
    class RocketPods;
    class ACE_AIR_SAFETY: RocketPods {
        CanLock = 0;
        displayName = "SAFE";
        displayNameMagazine = "SAFE";
        shortNameMagazine = "SAFE";
        nameSound = "cannon";
        cursor = "EmptyCursor";
        cursorAim = "EmptyCursor";
        magazines[] = {"FakeMagazine"};
        burst = 0;
        reloadTime = 0.01;
        magazineReloadTime = 0.1;
    };

    class CannonCore;
    // Fix attrocious A-10 Cannon Dispersion; Add high ROF capability
    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        magazines[] += {"ACE_1000Rnd_Gatling_30mm_Plane_CAS_HEI","ACE_1000Rnd_Gatling_30mm_Plane_CAS_AP","ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM41","ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM51"};
        class LowROF: Mode_FullAuto {
            multiplier = 3;
            burst = 1;
            burstRangeMax = 1;
            reloadtime = 0.046;
            dispersion = 0.0046; //0.279508497 = 0.25 * sqrt(0.8^-1); (80%, 5mil. https://en.wikipedia.org/wiki/GAU-8_Avenger#Accuracy) - Luke
            magazines[] = {"1000Rnd_Gatling_30mm_Plane_CAS_01_F", "ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM"};

        };
    };
    // bigger mag for comanche
    class gatling_20mm: CannonCore {
        magazines[] += {"ACE_500Rnd_20mm_shells_Comanche"};

        // buff gatling rof
        class manual: CannonCore {
            reloadTime = 0.023; //0.04;
            dispersion = 0.006; //0.0022;
        };

        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    class ACE_gatling_20mm_Comanche: gatling_20mm {
        displayName = CSTRING(gatling_20mm_Name);

        class manual: manual {
            reloadTime = 0.04;
            dispersion = 0.006;
            displayName = CSTRING(gatling_20mm_Name);
        };

        class close: close {
            reloadTime = 0.04;
            dispersion = 0.006;
        };

        class short: short {
            reloadTime = 0.04;
            dispersion = 0.006;
        };

        class medium: medium {
            reloadTime = 0.04;
            dispersion = 0.006;
        };

        class far: far {
            reloadTime = 0.04;
            dispersion = 0.006;
        };
    };

    // buff gatling rof
    class MGunCore;
    class MGun: MGunCore {};
    class LMG_RCWS: MGun {};
    class LMG_Minigun: LMG_RCWS {
        class manual: MGun {
            reloadTime = 0.075; //0.015;
            dispersion = 0.00093; //0.006;
        };

        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    class LMG_Minigun_heli: LMG_Minigun {
        showAimCursorInternal = 0;

        class manual: manual {
            reloadTime = 0.015; //0.033;    Note: This is a way to fast ROF (requires over 60 FPS)  @todo
            dispersion = 0.006; //0.0087;
        };

        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    class M134_minigun: MGunCore {
        class LowROF: Mode_FullAuto {
            reloadTime = 0.03; //0.03;     same as above   @todo
            dispersion = 0.0064; //0.0023;
            multiplier = 1;
        };

        class HighROF: LowROF {
            reloadTime = 0.02; //0.03;
            dispersion = 0.0064; //0.0023;
            multiplier = 1;
        };
    };
};
