class CfgAmmo {
    class Default;
    class Grenade: Default {
        GVAR(torqueDirection)[] = {1, 1, 0};
        GVAR(torqueMagnitude) = "(50 + random 100) * selectRandom [1, -1]";
    };
    class GrenadeCore: Default {
        GVAR(torqueDirection)[] = {1, 1, 0};
        GVAR(torqueMagnitude) = "(50 + random 100) * selectRandom [1, -1]";
    };
};
