// We need this since autocannons generally inherit from BulletBase
class BulletCore;
class BulletBase: BulletCore {};

class GrenadeCore;
class GrenadeBase: GrenadeCore {};

class LaserBombCore;
class ammo_Bomb_LaserGuidedBase: LaserBombCore {};

class MissileCore;
class MissileBase: MissileCore {};

class RocketCore;
class RocketBase: RocketCore {
    GVAR(skip) = 1;
};

class ArtilleryRocketCore: RocketCore {};

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
class BoundingMineBase: BoundingMineCore {};

class PipeBombCore;
class PipeBombBase: PipeBombCore {};

class DirectionalBombCore;
class DirectionalBombBase: DirectionalBombCore {};

class MineCore;
class MineBase: MineCore {};
