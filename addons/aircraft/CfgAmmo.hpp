class CfgAmmo {
    class BulletBase;
    class B_20mm: BulletBase {
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

    class ACE_20mm_HE: B_20mm {};
    class ACE_20mm_AP: B_20mm {
        hit = 50;
        indirectHit = 12;
        indirectHitRange = 0.3; //2;
        explosive = 0;
        CraterEffects = "";
        explosionEffects = "";
        EGVAR(vehicle_damage,incendiary) = 0.5;
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
        hit = 70; // default: 180
        indirectHit = 12; // default: 4
        indirectHitRange = 4; // default: 3
        caliber = 1.4; // default: 5
        deflecting = 3; // default: 5
        fuseDistance = 3; // default: 10
        tracerStartTime = 0.02; // default: 0.1
        timeToLive = 40; // default: 6
    };

    // adjust damage and splash damage, AP Rounds
    class ACE_Gatling_30mm_AP_Plane_CAS_01_F: Gatling_30mm_HE_Plane_CAS_01_F {
       explosive = 0.05; // default: 0.4
       caliber = 5; // default: 5
       deflecting = 8; // default: 5
       hit = 110; // default: 180
       indirectHit = 2.5; // default: 4
       indirectHitRange = 1; // default: 3
       fuseDistance = 0.2; // default: 10
       EGVAR(vehicle_damage,incendiary) = 1.0;
    };

   // adds submunition logic, enabling multiple rounds per frame
   class ACE_Gatling_30mm_Sub_HEI: SubmunitionBullet {
       submunitionAmmo = "Gatling_30mm_HE_Plane_CAS_01_F";
       weaponType = "cannon";
       submunitionConeType[] = {"randomcenter", 3};
       submunitionConeAngle = 0.056; // in degrees, 0.055 ~= 0.001 mils minute, but present
       model = "\A3\Weapons_f\Data\bullettracer\tracer_red.p3d";
       triggerTime = 0.005;
       ACE_caliber = 1.4;
       EGVAR(vehicle_damage,incendiary) = 1.0;
   };

   class ACE_Gatling_30mm_Sub_AP: ACE_Gatling_30mm_Sub_HEI {
        submunitionAmmo = "ACE_Gatling_30mm_AP_Plane_CAS_01_F";
        ACE_caliber = 1.4;
   };

    class ACE_Gatling_30mm_Sub_CM41: ACE_Gatling_30mm_Sub_HEI {
        submunitionAmmo[] = {"ACE_Gatling_30mm_AP_Plane_CAS_01_F",0.8,"Gatling_30mm_HE_Plane_CAS_01_F",0.2};
        ACE_caliber = 1.4;
    };

    class ACE_Gatling_30mm_Sub_CM51: ACE_Gatling_30mm_Sub_HEI {
        submunitionAmmo[] = {"ACE_Gatling_30mm_AP_Plane_CAS_01_F",0.83,"Gatling_30mm_HE_Plane_CAS_01_F",0.17};
        ACE_caliber = 1.4;
    };


    // adjust damage and splash damage, closer to bluefor gatling with same caliber
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 70; // default: 150
        indirectHit = 11; // default: 4
        indirectHitRange = 3; // default: 3
    };
};
