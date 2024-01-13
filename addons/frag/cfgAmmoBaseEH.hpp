// We need this since autocannons generally inherit from BulletBase
class BulletCore; 
class BulletBase: BulletCore {
    ACE_FRAG_ADD_EH_BASE;
};

class GrenadeCore;
class GrenadeBase: GrenadeCore {
    ACE_FRAG_ADD_EH_BASE;
};

class LaserBombCore;
class ammo_Bomb_LaserGuidedBase: LaserBombCore {
    ACE_FRAG_ADD_EH_BASE;
};

class MissileCore;
class MissileBase: MissileCore {
    ACE_FRAG_ADD_EH_BASE;
};

class RocketCore;
class RocketBase: RocketCore {
    ACE_FRAG_ADD_EH_BASE;
    GVAR(skip) = 1;
};

class ArtilleryRocketCore: RocketCore {
    ACE_FRAG_ADD_EH_BASE;
};

class ShellCore;
class ShellBase: ShellCore {
    ACE_FRAG_ADD_EH_BASE;
};

class ShotDeployCore;
class ShotDeployBase: ShotDeployCore {
    GVAR(skip) = 1;
};

class ShotgunCore;
class ShotgunBase: ShotgunCore {
    ACE_FRAG_ADD_EH_BASE;
};

class SubmunitionCore;
class SubmunitionBase: SubmunitionCore {
    ACE_FRAG_ADD_EH_BASE;
};

class BoundingMineCore;
class BoundingMineBase: BoundingMineCore {
    ACE_FRAG_ADD_EH_BASE;
};

class PipeBombCore;
class PipeBombBase: PipeBombCore {
    ACE_FRAG_ADD_EH_BASE;
};

class DirectionalBombCore;
class DirectionalBombBase: DirectionalBombCore {
    ACE_FRAG_ADD_EH_BASE;
};

class MineCore;
class MineBase: MineCore {
    ACE_FRAG_ADD_EH_BASE;
};