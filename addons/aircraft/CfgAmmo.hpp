class CfgAmmo {
    class BulletBase;
    class B_20mm : BulletBase {
        hit = 80;
        indirectHit = 12;
        indirectHitRange = 2; //2;
        caliber = 1.4;
        tracerStartTime = 0.02;
        timeToLive = 40;
        explosive = 1.8;
        tracersEvery = 3;
        tracerEndTime = 3.5;
        CraterEffects = "ExploAmmoCrater";
        explosionEffects = "ExploAmmoExplosion";
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
    };

    class ACE_20mm_HE : B_20mm {};
    class ACE_20mm_AP : B_20mm {
        hit = 50;
        indirectHit = 12;
        indirectHitRange = 0.3; //2;
        explosive = 0;
        CraterEffects = "";
        explosionEffects = "";
    };

    // adjust minigun caliber and deflection to other ammo
    class SubmunitionBullet;
    class B_65x39_Minigun_Caseless: SubmunitionBullet {
        caliber = 1;
        deflecting = 15;
    };

    class B_762x51_Minigun_Tracer_Red: SubmunitionBullet {
        caliber = 1.6;
        deflecting = 15;
    };

    // also adjust tracer, "muh lightshow"; also adjust splash damage radius
    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
        hit = 80; // default: 180
        indirectHit = 12; // default: 4
        indirectHitRange = 3; // default: 3
        caliber = 1.4; // default: 5
        deflecting = 3; // default: 5
        fuseDistance = 3; // default: 10
        tracerStartTime = 0.02; // default: 0.1
        timeToLive = 40; // default: 6
    };

    // adjust damage and splash damage, closer to bluefor gatling with same caliber
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 70; // default: 150
        indirectHit = 11; // default: 4
        indirectHitRange = 3; // default: 3
    };
};
