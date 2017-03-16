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
        hit = 80;
        indirectHit = 12;
        indirectHitRange = 3; //2;
        caliber = 1.4;
        deflecting = 3;
        fuseDistance = 3;
        tracerStartTime = 0.02;
        timeToLive = 40;
    };

    // GAU-8 Mix ammo (AP&HE)
    class ACE_GAU8_30mm_Mix_Plane_CAS_01_F: Gatling_30mm_HE_Plane_CAS_01_F {
        laserLock = 1;
        hit = 300;
        indirectHit = 100;
        indirectHitRange = 3.5;
        caliber = 4.1700001;
        airFriction = -0.00036000001;
        explosive = 0.34999999;
        soundHit1[] = {QPATHTOF(sounds\ammo\GAU8_Hit1),3.1622779,1,2000};
        soundHit2[] = {QPATHTOF(sounds\ammo\GAU8_Hit1),3.1622779,1,2000};
        soundHit3[] = {QPATHTOF(sounds\ammo\GAU8_Hit1),3.1622779,1,2000};
        soundHit4[] = {QPATHTOF(sounds\ammo\GAU8_Hit1),3.1622779,1,2000};
        multiSoundHit[] = {"soundHit1",0.25,"soundHit2",0.25,"soundHit3",0.25,"soundHit4",0.25};
        SoundSetExplosion[] = {"ACE_GAU8_30mm_Exp_SoundSet"};
        explosionSoundEffect = "DefaultExplosion";
        explosionEffects = "ACE_Gau8ShellImpact";
        muzzleEffect = "ace_aircraft_fnc_gau8_muzzleEffect";
        craterEffects = "HEShellCrater";
    };

    // adjust damage and splash damage, closer to bluefor gatling with same caliber
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 70; //40;
        indirectHit = 11; //14;
        indirectHitRange = 3;
    };
};
