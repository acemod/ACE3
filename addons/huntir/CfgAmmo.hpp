class CfgAmmo {
    class FlareBase;
    class F_HuntIR: FlareBase {
        model = PATHTOF(data\ace_m1070_armed.p3d);
        lightColor[] = {0, 0, 0, 0};
        smokeColor[] = {0, 0, 0, 0};
        timeToLive = 6;
    };
    
    class ShellBase;
    class ACE_HuntIR_Propell: ShellBase {
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        explosive = 1;
        typicalSpeed = 100;
        cost = 300;
        model = "\A3\weapons_f\empty";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
        soundHit[] = { "A3\Sounds_F\weapons\Rockets\rocket_fly_1", 3.16228, 3, 250 };
        soundDefault1[] = { "A3\Sounds_F\weapons\Rockets\rocket_fly_1", 3.16228, 3, 250 };
        soundDefault2[] = { "A3\Sounds_F\weapons\Rockets\rocket_fly_1", 3.16228, 3, 250 };
        soundDefault3[] = { "A3\Sounds_F\weapons\Rockets\rocket_fly_1", 3.16228, 3, 250 };
        supersonicCrackNear[] ={ "",1,1,100};
        supersonicCrackFar[] = { "",1,1,150};
        soundFly[] = {"",1,1};
        soundEngine[] ={"",1,4};
        CraterEffects = "NoCrater";
        explosionEffects = "ACE_HuntIR_Propell_Fx";
        class HitEffects {};
    };
};
