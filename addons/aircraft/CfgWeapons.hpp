
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class MGunCore;
    class MGun: MGunCore {};

    class LMG_RCWS: MGun {};

    // Manual Switching Of Flare Mode
    class SmokeLauncher;
    class CMFlareLauncher: SmokeLauncher {
        modes[] = {"Single", "Burst", "AIBurst"};
        class Single: Mode_SemiAuto {
            reloadTime = 0.1;
        };
        class Burst: Mode_Burst {
            displayName = "$STR_ACE_Aircraft_CMFlareLauncher_Burst_Name";
        };
    };

    class CannonCore;
    class gatling_20mm: CannonCore {
        magazines[] = {"2000Rnd_20mm_shells","1000Rnd_20mm_shells","300Rnd_20mm_shells","ACE_500Rnd_20mm_shells_Comanche"};

        class manual: CannonCore {
            reloadTime = 0.023;
            dispersion = 0.006;
        };
        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    class ACE_gatling_20mm_Comanche: gatling_20mm {
        displayName = "XM301";
        class close: close {
            reloadTime = 0.04;
            dispersion = 0.0022;
        };
        class far: far {
            reloadTime = 0.04;
            dispersion = 0.0022;
        };
        class manual: manual {
            reloadTime = 0.04;
            dispersion = 0.0022;
            displayName = "XM301";
        };
        class medium: medium {
            reloadTime = 0.04;
            dispersion = 0.0022;
        };
        class short: short {
            reloadTime = 0.04;
            dispersion = 0.0022;
        };
    };

    class LMG_Minigun: LMG_RCWS {
        magazines[] = {"1000Rnd_65x39_Belt","1000Rnd_65x39_Belt_Green","1000Rnd_65x39_Belt_Tracer_Green","1000Rnd_65x39_Belt_Tracer_Red","1000Rnd_65x39_Belt_Tracer_Yellow","1000Rnd_65x39_Belt_Yellow","2000Rnd_65x39_Belt","2000Rnd_65x39_Belt_Green","2000Rnd_65x39_Belt_Tracer_Green","2000Rnd_65x39_Belt_Tracer_Green_Splash","2000Rnd_65x39_Belt_Tracer_Red","2000Rnd_65x39_Belt_Tracer_Yellow","2000Rnd_65x39_Belt_Tracer_Yellow_Splash","2000Rnd_65x39_Belt_Yellow","2000Rnd_762x51_Belt_T_Green","2000Rnd_762x51_Belt_T_Red","2000Rnd_762x51_Belt_T_Yellow","200Rnd_65x39_Belt","200Rnd_65x39_Belt_Tracer_Green","200Rnd_65x39_Belt_Tracer_Red","200Rnd_65x39_Belt_Tracer_Yellow","5000Rnd_762x51_Belt","5000Rnd_762x51_Yellow_Belt"};
        class manual: MGun {
            reloadTime = 0.015;
            dispersion = 0.006;
        };
        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };
    class LMG_Minigun_heli: LMG_Minigun {
        showAimCursorInternal = 0;
        class manual: manual {
            reloadTime = 0.015;
            dispersion = 0.006;
        };
        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };
    class M134_minigun: MGunCore {
        class LowROF: Mode_FullAuto {
            reloadTime = 0.015;
            dispersion = 0.006;
        };
        class HighROF: LowROF {
            reloadTime = 0.015;
            dispersion = 0.006;
        };
        class close: HighROF {};
        class short: close {};
        class medium: LowROF {};
        class far: medium {};
    };

    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        autoFire = 1;
        burst = 1;
        reloadTime = 0.0154;
        class LowROF: Mode_FullAuto {
            autoFire = 0;
            //burst = 65;
            burst = 22;
            //reloadTime = 0.0154;
            reloadTime = 0.0462;
            //sound[] = {"A3\Sounds_F_epc\weapons\cas_02_cannon",1.77828,1,3800};
            sound[] = {"A3\Sounds_F_EPC\Weapons\gau_03_burst",2.51189,1,4500,{25704,32159}};
            weaponSoundEffect = "DefaultRifle";
            dispersion = 0.005;
            soundContinuous = 1;
            textureType = "burst";
            multiplier = 3;
        };
        class close: LowROF {};
        class near: close {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    class RocketPods;
    class Missile_AA_04_Plane_CAS_01_F: RocketPods {
        holdsterAnimValue = 2;
        aiRateOfFire = 5;
        aiRateOfFireDistance = 500;
        autoFire = 0;
        cursor = "EmptyCursor";
        cursorAim = "missile";
        nameSound = "MissileLauncher";
        textureType = "fullAuto";
        weaponLockDelay = 3;
        minRange = 300;
        minRangeProbab = 0.25;
        midRange = 2500;
        midRangeProbab = 0.9;
        maxRange = 9000;
        maxRangeProbab = 0.01;
    };

    class MissileLauncher;
    class Missile_AGM_02_Plane_CAS_01_F: MissileLauncher {
        holdsterAnimValue = 3;
        magazineReloadTime = 30;
        reloadTime = 0.001;
        textureType = "semi";
        weaponLockDelay = 3;
        weaponSoundEffect = "DefaultRifle";
    };

    class Rocket_04_HE_Plane_CAS_01_F: RocketPods {
        holdsterAnimValue = 4;
        canLock = 1;
        modes[] = {"Far_AI","Medium_AI","Close_AI","Burst"};
        weaponLockDelay = 0;
        class Far_AI: RocketPods {
            canLock = 1;
            weaponLockDelay = 0;
            showToPlayer = 0;
            minRange = 800;
            minRangeProbab = 0.31;
            midRange = 2500;
            midRangeProbab = 0.71;
            maxRange = 3200;
            maxRangeProbab = 0.1;
            burst = 1;
            reloadTime = 0.001;
            autoFire = 0;
            aiRateOfFire = 5;
            aiRateOfFireDistance = 500;
        };
        class Medium_AI: Far_AI {};
        class Close_AI: Far_AI {};
        class Burst: RocketPods {
            burst = 1;
            reloadTime = 0.002;
            minRange = 300;
            minRangeProbab = 0.25;
            midRange = 400;
            midRangeProbab = 0.7;
            maxRange = 1300;
            maxRangeProbab = 0.1;
            aiRateOfFire = 5;
            aiRateOfFireDistance = 500;
            autoFire = 0;
            soundContinuous = 0;
            textureType = "fullAuto";
            weaponSoundEffect = "DefaultRifle";
        };
    };

    class Rocket_04_AP_Plane_CAS_01_F: Rocket_04_HE_Plane_CAS_01_F {
        holdsterAnimValue = 5;
    };

    class Bomb_04_Plane_CAS_01_F: RocketPods {
        holdsterAnimValue = 6;
        aiRateOfFire = 5;
        aiRateOfFireDistance = 500;
        missileLockCone = 180;
        nameSound = "";
        textureType = "fullAuto";
        weaponLockDelay = 1;
    };

    class Cannon_30mm_Plane_CAS_02_F: CannonCore {
        scope = 1;
        holdsterAnimValue = 1;
        ballisticsComputer = 2;
        canLock = 1;
        modes[] = {"LowROF","close","near","short","medium","far"};
        nameSound = "cannon";
        shotFromTurret = 0;
        muzzlePos = "Cannon_muzzleflash";
        muzzleEnd = "Cannon_barrel_end";
        selectionFireAnim = "Cannon_muzzleflash";
        autoFire = 1;
        burst = 5;
        reloadTime = 0.04;
        class GunParticles {
            class Effect {
                effectName = "MachineGun2";
                positionName = "Cannon_barrel_start";
                directionName = "Cannon_barrel_end";
            };
        };
        class LowROF: Mode_FullAuto {
            dispersion = 0.0055;
            reloadTime = 0.04;
        };
        class close: LowROF {};
        class near: close {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };
};
