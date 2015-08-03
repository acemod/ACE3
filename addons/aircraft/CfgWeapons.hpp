
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {

    class RocketPods;
    class ACE_AIR_SAFETY : RocketPods {
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

    // Manual Switching Of Flare Mode
    class SmokeLauncher;
    class CMFlareLauncher: SmokeLauncher {
        modes[] = {"Single","Burst","AIBurst"};
        class Single: Mode_SemiAuto {
            reloadTime = 0.1;
        };
        class Burst: Mode_Burst {
            displayName = CSTRING(CMFlareLauncher_Burst_Name);
        };
    };

    // bigger mag for comanche
    class CannonCore;
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
        class close: HighROF {};
        class short: close {};
        class medium: LowROF {};
        class far: medium {};
    };

    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        displayName = "GAU-8";
        canLock = 2;
        dispersion = 0.0082;
        modes[] = {"autoLO","autoHI","close","near","short","medium","far"};
        autoFire = 0;
        burst = 20;
        class GunParticles {
            class Effect {
                effectName = "MachineGun3";
                positionName = "Gatling_barrels_end";
                directionName = "Gatling_barrels_start";
            };
        };
        class autoLO: Mode_FullAuto {
            displayName = "LO";
            displayNameShort = "LO";
            reloadTime = 0.012;
            dispersion = 0.0082;
            //sounds[] = {"StandardSound"};
            //class StandardSound {
            //    begin1[] = {PATHTOF(sounds\GAU8_LO),6.581072,1,4500};
            //    soundBegin[] = {"begin1",1};
            //    weaponSoundEffect = "DefaultRifle";
            //};
            soundContinuous = 1;
            autoFire = 1;
            flash = "gunfire";
            flashSize = 0.1;
            recoil = "Empty";
            aiDispersionCoefX = 10;
            aiDispersionCoefY = 10;
            ffMagnitude = 0.5;
            ffFrequency = 11;
            ffCount = 6;
            minRange = 1;
            minRangeProbab = 0.06;
            midRange = 2;
            midRangeProbab = 0.06;
            maxRange = 3;
            maxRangeProbab = 0.004;
            showToPlayer = 1;
            textureType = "burst";
        };
        class autoHI: autoLO {
            displayName = "HI";
            displayNameShort = "HI";
            reloadTime = 0.008;
            textureType = "fullAuto";
            //class StandardSound {
            //    begin1[] = {PATHTOF(sounds\GAU8_HI),6.581072,1,4500};
            //    soundBegin[] = {"begin1",1};
            //    weaponSoundEffect = "DefaultRifle";
            //};
        };
        class close: autoLO {
            showToPlayer = 0;
            burst = 25;
            aiRateOfFire = 0.25;
            aiRateOfFireDistance = 400;
            minRange = 1;
            minRangeProbab = 0.35;
            midRange = 200;
            midRangeProbab = 0.88;
            maxRange = 400;
            maxRangeProbab = 0.3;
        };
        class near: close {
            showToPlayer = 0;
            burst = 20;
            aiRateOfFire = 0.25;
            aiRateOfFireDistance = 400;
            minRange = 1;
            minRangeProbab = 0.35;
            midRange = 150;
            midRangeProbab = 0.88;
            maxRange = 300;
            maxRangeProbab = 0.3;
        };
        class short: close {
            burst = 15;
            aiRateOfFire = 0.5;
            aiRateOfFireDistance = 600;
            minRange = 200;
            minRangeProbab = 0.3;
            midRange = 400;
            midRangeProbab = 0.88;
            maxRange = 600;
            maxRangeProbab = 0.3;
        };
        class medium: close {
            burst = 10;
            aiRateOfFire = 1;
            aiRateOfFireDistance = 900;
            minRange = 400;
            minRangeProbab = 0.3;
            midRange = 700;
            midRangeProbab = 0.78;
            maxRange = 900;
            maxRangeProbab = 0.2;
        };
        class far: close {
            burst = 5;
            aiRateOfFire = 1.5;
            aiRateOfFireDistance = 1500;
            minRange = 800;
            minRangeProbab = 0.2;
            midRange = 1000;
            midRangeProbab = 0.6;
            maxRange = 1500;
            maxRangeProbab = 0.1;
        };
    };
};
