class CfgAmmo {
    class FlareBase;
    class F_HuntIR: FlareBase {
        model = QPATHTOF(data\ace_m1070_armed.p3d);
        lightColor[] = {0, 0, 0, 0};
        smokeColor[] = {0, 0, 0, 0};
        timeToLive = 6;
    };

    class ShellBase;
    class ACE_HuntIR_Propell: ShellBase {
        supersonicCrackNear[] = {"",0.316228,1,50};
        supersonicCrackFar[] = {"",0.223872,1,150};
        CraterEffects = "";
        CraterWaterEffects = "";
        ExplosionEffects = "ACE_HuntIR_Propell_Fx";
        visibleFire = 1;
        audibleFire = 1;
        dangerRadiusHit = -1;
        suppressionRadiusHit = 0;
        soundHit1[] = {"",3.16228,1,2000};
        soundHit2[] = {"",3.16228,1,2000};
        soundHit3[] = {"",3.16228,1,2000};
        soundHit4[] = {"",3.16228,1,2000};
        soundHit5[] = {"",3.16228,1,2000};
        soundHit6[] = {"",3.16228,1,2000};
        soundHit7[] = {"",3.16228,1,2000};
        soundHit8[] = {"",3.16228,1,2000};
        SoundSetExplosion[] = {};
        multiSoundHit[] = {};
        class HitEffects {};
        soundFakeFall0[] = {"",3.16228,1,1000};
        soundFakeFall1[] = {"",3.16228,1,1000};
        soundFakeFall2[] = {"",3.16228,1,1000};
        soundFakeFall3[] = {"",3.16228,1,1000};
        soundFakeFall[] = {};
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        explosive = 1;
        model = "\A3\weapons_f\empty";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
    };
};
