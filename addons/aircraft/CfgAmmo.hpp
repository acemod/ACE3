
class CfgAmmo {
    class BulletBase;
    class B_20mm: BulletBase {
        deflecting = 3;
        hit = 100;
        indirectHit = 10;
        indirectHitRange = 2;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
    };

    class SubmunitionBullet;
    class B_65x39_Minigun_Caseless: SubmunitionBullet {
        hit = 10;
        indirectHit = 0;
        indirectHitRange = 0;
        caliber = 1;
        deflecting = 5;
        typicalSpeed = 850;
    };

    class B_762x51_Minigun_Tracer_Red: SubmunitionBullet {
        hit = 12;
        indirectHit = 0;
        indirectHitRange = 0;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
        caliber = 1.6;
        deflecting = 5;
        typicalSpeed = 850;
    };

    class M_Titan_AA;
    class M_Zephyr: M_Titan_AA {
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AA_02_F.p3d";
        model = "\A3\Weapons_F\Ammo\Missile_AA_02_fly_F.p3d";
        airFriction = 0.078;
        sideAirFriction = 0.18;
        maneuvrability = 24;
        class CamShakeFire {};
        class CamShakePlayerFire {};
    };

    class M_Zephyr_Mi06: M_Zephyr {
        maverickWeaponIndexOffset = 6;
    };

    class MissileBase;
    class M_Air_AA: MissileBase {
        model = "\A3\Weapons_F\Ammo\Missile_AT_02_fly_F";
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_02_F";
        hit = 280;
        indirectHit = 85;
        indirectHitRange = 10;
        maneuvrability = 27;
        simulationStep = 0.002;
        airLock = 1;
        irLock = 1;
        cost = 1500;
        //maxSpeed = 2400;
        timeToLive = 40;
        airFriction = 0.05;
        sideAirFriction = 0.1;
        trackOversteer = 1;
        trackLead = 1;
        initTime = 0;
        thrustTime = 12;
        thrust = 340;
        fuseDistance = 500;
        weaponLockSystem = "2 + 16";
        maxControlRange = 8000;
        class CamShakeExplode {};
        class CamShakeHit {};
        class CamShakeFire {};
        class CamShakePlayerFire {};
    };

    class Missile_AA_04_F: MissileBase {
        hit = 800;
        indirectHit = 60;
        indirectHitRange = 12;
        airLock = 2;
        irLock = 1;
        laserLock = 0;
        nvLock = 0;
        weaponLockSystem = "2 + 16";
        cmimmunity = 0.8;
        initTime = 0;
        thrust = 380;
        thrustTime = 9.5;
        airFriction = 0.04;
        sideAirFriction = 0.08;
        //maxSpeed = 2600;
        maneuvrability = 14;
        simulationStep = 0.002;
        fuseDistance = 500;
        timeToLive = 19;
        trackLead = 1;
        trackOversteer = 1;
    };

    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red.p3d";
        cost = 20;
        hit = 80;
        indirectHit = 12;
        indirectHitRange = 3;
        caliber = 1.4;
        explosive = 0.6;
        airlock = 1;
        deflecting = 3;
        airFriction = -0.00042;
        typicalSpeed = 960;
        visibleFire = 32;
        audibleFire = 32;
        visibleFireTime = 3;
        fuseDistance = 3;
        tracerScale = 2.5;
        tracerStartTime = 0.02;
        tracerEndTime = 4.7;
        multiSoundHit[] = {"soundHit1",0.2,"soundHit2",0.2,"soundHit3",0.2,"soundHit4",0.1,"soundHit5",0.15,"soundHit6",0.15};
        soundFly[] = {"A3\Sounds_F\weapons\Explosion\cannon_fly",1,1,50};
        explosionSoundEffect = "DefaultExplosion";
        explosionEffects = "ExploAmmoExplosion";
        craterEffects = "ExploAmmoCrater";
        soundHit1[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_1",3.16228,1,1600};
        soundHit2[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_2",3.16228,1,1600};
        soundHit3[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_3",3.16228,1,1600};
        soundHit4[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_4",3.16228,1,1600};
        soundHit5[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_5",3.16228,1,1600};
        soundHit6[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_6",3.16228,1,1600};
        class CamShakeExplode {};
        class CamShakeHit {};
        class CamShakeFire {};
        class CamShakePlayerFire {};
    };
    class ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy: Gatling_30mm_HE_Plane_CAS_01_F {
        simulation = "shotSubmunitions";
        triggerTime = 0;
        submunitionAmmo = "ACE_Gatling_30mm_HE_Plane_CAS_01_Sub";
        submunitionConeType[] = {"custom", {{0,0}, {0,0}, {0,0}} };
    };
    class ACE_Gatling_30mm_HE_Plane_CAS_01_Sub: Gatling_30mm_HE_Plane_CAS_01_F {
    };

    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        model = "\A3\Weapons_f\Data\bullettracer\tracer_green.p3d";
        hit = 70;
        indirectHit = 11;
        indirectHitRange = 3;
        caliber = 2;
        explosive = 0.6;
    };

    class Missile_AGM_02_F: MissileBase {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_02_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_02_F.p3d";
        maverickWeaponIndexOffset = 2;
        cost = 1500;
        hit = 2100;
        indirectHit = 85;
        indirectHitRange = 8;
        manualControl = 0;
        maxControlRange = 8000;
        airLock = 0;
        irLock = 1;
        laserLock = 0;
        nvLock = 0;
        weaponLockSystem = "2 + 16";
        cmimmunity = 0.8;
        initTime = 0;
        thrust = 240;
        thrustTime = 5;
        airFriction = 0.05;
        sideAirFriction = 0.1;
        maxSpeed = 828;
        maneuvrability = 27;
        simulationStep = 0.002;
        fuseDistance = 500;
        timeToLive = 40;
        trackLead = 1;
        trackOversteer = 1;
        craterEffects = "AAMissileCrater";
        effectsMissile = "missile3";
        explosionEffects = "AAMissileExplosion";
        muzzleEffect = "BIS_fnc_effectFiredHeliRocket";
        whistleDist = 20;
        class CamShakeExplode {};
        class CamShakeHit {};
        class CamShakeFire {};
        class CamShakePlayerFire {};
    };

    class LaserBombCore;
    class Bomb_04_F: LaserBombCore {
        model = "\A3\Weapons_F_EPC\Ammo\Bomb_04_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Bomb_04_F.p3d";
        maverickWeaponIndexOffset = 8;
        hit = 6000;
        indirectHit = 1400;
        indirectHitRange = 15;
        nvLock = 1;
        weaponLockSystem = "2 + 16 + 4";
        maneuvrability = 20;
        fuseDistance = 35;
        trackLead = 0.95;
        trackOversteer = 1;
        craterEffects = "BombCrater";
        explosionEffects = "BombExplosion";
        explosionSoundEffect = "DefaultExplosion";
        explosionTime = 2;
        multiSoundHit[] = {"soundHit1",0.2,"soundHit2",0.2,"soundHit3",0.2,"soundHit4",0.2,"soundHit5",0.2};
        soundHit1[] = {"\A3\Sounds_F\weapons\Explosion\expl_big_1",2.51189,1,2400};
        soundHit2[] = {"\A3\Sounds_F\weapons\Explosion\expl_big_2",2.51189,1,2400};
        soundHit3[] = {"\A3\Sounds_F\weapons\Explosion\expl_big_3",2.51189,1,2400};
        soundHit4[] = {"\A3\Sounds_F\weapons\Explosion\expl_shell_1",2.51189,1,2400};
        soundHit5[] = {"\A3\Sounds_F\weapons\Explosion\expl_shell_2",2.51189,1,2400};
        whistleDist = 24;
    };

    class Rocket_04_HE_F: MissileBase {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_04_HE_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Rocket_04_HE_F.p3d";
        maverickWeaponIndexOffset = 12;
        cost = 500;
        hit = 210;
        indirectHit = 55;
        indirectHitRange = 15;
        manualControl = 0;
        maxControlRange = 8000;
        airLock = 0;
        irLock = 1;
        laserLock = 0;
        nvLock = 0;
        weaponLockSystem = 0;
        cmimmunity = 1;
        initTime = 0.002;
        thrust = 1600;
        thrustTime = 0.7;
        airFriction = 0.0046;
        sideAirFriction = 0.005;
        maxSpeed = 610;
        maneuvrability = 0;
        fuseDistance = 50;
        timeToLive = 60;
        effectsMissileInit = "MissileDAR1";
        whistleDist = 30;
        class CamShakeExplode {};
        class CamShakeHit {};
        class CamShakeFire {};
        class CamShakePlayerFire {};
    };

    class Rocket_04_AP_F: Rocket_04_HE_F {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_04_AP_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Rocket_04_AP_F.p3d";
        maverickWeaponIndexOffset = 19;
        hit = 400;
        indirectHit = 20;
        indirectHitRange = 10;
    };

    class Missile_AA_03_F: Missile_AA_04_F {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AA_03_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Missile_AA_03_F.p3d";
        maverickWeaponIndexOffset = 0;
        hit = 900;
        indirectHit = 50;
        indirectHitRange = 15;
    };

    class Missile_AGM_01_F: Missile_AGM_02_F {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_01_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_01_F.p3d";
        maverickWeaponIndexOffset = 2;
        hit = 2200;
        indirectHit = 90;
        indirectHitRange = 10;
    };

    class Bomb_03_F: Bomb_04_F {
        model = "\A3\Weapons_F_EPC\Ammo\Bomb_03_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Bomb_03_F.p3d";
        maverickWeaponIndexOffset = 6;
        hit = 6400;
        indirectHit = 1400;
        indirectHitRange = 16;
    };

    class Rocket_03_HE_F: Rocket_04_HE_F {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_F.p3d";
        maverickWeaponIndexOffset = 8;
    };

    class Rocket_03_AP_F: Rocket_04_AP_F {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_AP_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_EPC\Ammo\Rocket_03_AP_F.p3d";
        maverickWeaponIndexOffset = 28;
    };

    class RocketBase;
};
