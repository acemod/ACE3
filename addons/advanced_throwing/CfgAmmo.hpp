class CfgAmmo {
    class Default;
    class Grenade: Default {
        GVAR(torqueDirection)[] = {1, 1, 0};
        GVAR(torqueMagnitude) = "(50 + random 100) * selectRandom [1, -1]";
    };
    class GrenadeCore: Default {};
    class FlareCore: GrenadeCore {};
    class FlareBase: FlareCore {
        GVAR(torqueDirection)[] = {1, 1, 0};
        GVAR(torqueMagnitude) = "(50 + random 100) * selectRandom [1, -1]";
    };
    class GrenadeBase: GrenadeCore {
        GVAR(torqueDirection)[] = {1, 1, 0};
        GVAR(torqueMagnitude) = "(50 + random 100) * selectRandom [1, -1]";
    };
};
