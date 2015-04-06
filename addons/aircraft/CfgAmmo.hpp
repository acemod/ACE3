
class CfgAmmo {
    class BulletBase;
    class B_20mm;
    
    class ACE_20mm_HEDP : B_20mm {
		hit = 80;
        indirectHit = 25;
        indirectHitRange = 1.7; //2;
        fuseDistance = 3;
        timeToLive = 40;
		explosive = 0.4;
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
        hit = 80;
        indirectHit = 12;
        indirectHitRange = 3; //2;
        caliber = 1.4;
        deflecting = 3;
        fuseDistance = 3;
        tracerStartTime = 0.02;
        timeToLive = 40;
    };

    // helper projectiles to simulate a rof > fps
    class ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy: Gatling_30mm_HE_Plane_CAS_01_F {
        simulation = "shotSubmunitions";
        triggerTime = 0;
        submunitionAmmo = "ACE_Gatling_30mm_HE_Plane_CAS_01_Sub";
        submunitionConeType[] = {"custom", {{0,0}, {0,0}, {0,0}} };
    };

    class ACE_Gatling_30mm_HE_Plane_CAS_01_Sub: Gatling_30mm_HE_Plane_CAS_01_F {};

    // adjust damage and splash damage, closer to bluefor gatling with same caliber
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 70; //40;
        indirectHit = 11; //14;
        indirectHitRange = 3;
    };
};
