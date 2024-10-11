class CfgAmmo {
    class PipeBombBase;
    class CUP_TimeBomb_Ammo: PipeBombBase {
        hit = 3000;
        indirectHit = 3000;
        indirectHitRange = 5;
        EGVAR(explosives,explodeOnDefuse) = 0.02;
    };
    class CUP_PipeBomb_Ammo: PipeBombBase {
        hit = 3000;
        indirectHit = 3000;
        indirectHitRange = 5;
        EGVAR(explosives,explodeOnDefuse) = 0.02;
    };

    class CUP_Mine_Ammo;
    class CUP_IED_V1_Ammo: CUP_Mine_Ammo {
        EGVAR(explosives,explodeOnDefuse) = 0.06;
        triggerWhenDestroyed = 1;
    };
};
