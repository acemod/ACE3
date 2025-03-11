class CfgAmmo {
    // these below do get inherited
    class DirectionalBombCore;
    class DirectionalBombBase: DirectionalBombCore {
        GVAR(detectable) = 1;
    };

    class BoundingMineCore;
    class BoundingMineBase: BoundingMineCore {
        GVAR(detectable) = 1;
    };

    class MineCore;
    class MineBase: MineCore {
        GVAR(detectable) = 1;
    };

    class PipeBombCore;
    class PipeBombBase: PipeBombCore {
        GVAR(detectable) = 1;
    };

};
