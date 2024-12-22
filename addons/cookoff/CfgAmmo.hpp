class CfgAmmo {
    class ShellBase;
    class ace_ammoExplosion: ShellBase {
        hit = 10;
        indirectHit = 0.5;
        indirectHitRange = 1;
        soundHit[] = {"", 1, 1, 0};
        typicalSpeed = 100;
        explosive = 0;
        cost = 300;
        model = "\A3\Weapons_F\empty.p3d";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
        soundFly[] = {"",1,1};
        soundEngine[] = {"",1,4};
        explosionEffects = "ExploAmmoExplosion";
    };

    class SmallSecondary;
    class ACE_ammoExplosionLarge: SmallSecondary {
        soundHit[] = {"", 1, 1, 0};
        model = "\A3\Weapons_F\empty.p3d";
        soundFly[] = {"",1,1};
        soundEngine[] = {"",1,4};
        soundHit1[] = {"",1,1,1};
        soundHit2[] = {"",1,1,1};
        soundHit3[] = {"",1,1,1};
        supersonicCrackFar[] = {"",1,1,1};
        supersonicCrackNear[] = {"",1,1,1};
        craterEffects = "ImpactEffectsMedium";
    };
};
