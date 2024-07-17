// We need this since autocannons generally inherit from BulletBase
class BulletCore;
class BulletBase: BulletCore {
    class EventHandlers;
};

class GrenadeCore;
class GrenadeBase: GrenadeCore {
    class EventHandlers;
};

class LaserBombCore;
class ammo_Bomb_LaserGuidedBase: LaserBombCore {
    class EventHandlers;
};

class MissileCore;
class MissileBase: MissileCore {
    class EventHandlers;
};

class RocketCore;
class RocketBase: RocketCore {
    GVAR(skip) = 1;
};

class ArtilleryRocketCore: RocketCore {
    class EventHandlers;
};

class ShellCore;
class ShellBase: ShellCore {};

class ShotDeployCore;
class ShotDeployBase: ShotDeployCore {
    GVAR(skip) = 1;
};

class ShotgunCore;
class ShotgunBase: ShotgunCore {};

class SubmunitionCore;
class SubmunitionBase: SubmunitionCore {
    GVAR(skip) = 1;
};

class BoundingMineCore;
class BoundingMineBase: BoundingMineCore {
    class EventHandlers;
};

class PipeBombCore;
class PipeBombBase: PipeBombCore {
    class EventHandlers;
};

class DirectionalBombCore;
class DirectionalBombBase: DirectionalBombCore {
    class EventHandlers;
};

class MineCore;
class MineBase: MineCore {
    class EventHandlers;
};
