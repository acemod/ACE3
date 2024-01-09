#define ACE_FRAG_ADD_EH class EventHandlers {\
	class ADDON {\
		init = QUOTE(_this call FUNC(initRound));\
	};\
}

class BombCore;
class Bo_Mk82: BombCore {
	ACE_FRAG_ADD_EH;
};

class BulletCore;
class BulletBase: BulletCore {
	ACE_FRAG_ADD_EH;
};

class Grenade;
class GrenadeHand: Grenade {
	ACE_FRAG_ADD_EH;
};

class GrenadeCore;
class GrenadeBase: GrenadeCore {
	ACE_FRAG_ADD_EH;
};

class LaserBombCore;
class ammo_Bomb_LaserGuidedBase: LaserBombCore {
	ACE_FRAG_ADD_EH;
};

class MissileCore;
class MissileBase: MissileCore {
	ACE_FRAG_ADD_EH;
};

class RocketCore;
class RocketBase: RocketCore {
	ACE_FRAG_ADD_EH;
};

class ArtilleryRocketCore: RocketCore {
	ACE_FRAG_ADD_EH;
};

class ShellCore;
class ShellBase: ShellCore {
	ACE_FRAG_ADD_EH;
};

class ShotDeployCore;
class ShotDeployBase: ShotDeployCore {
	ACE_FRAG_ADD_EH;
};

class ShotgunCore;
class ShotgunBase: ShotgunCore {
	ACE_FRAG_ADD_EH;
};

class SubmunitionCore;
class SubmunitionBase: SubmunitionCore {
	ACE_FRAG_ADD_EH;
};

class BoundingMineCore;
class BoundingMineBase: BoundingMineCore {
	ACE_FRAG_ADD_EH;
};

class PipeBombCore;
class PipeBombBase: PipeBombCore {
	ACE_FRAG_ADD_EH;
};

class DirectionalBombCore;
class DirectionalBombBase: DirectionalBombCore {
	ACE_FRAG_ADD_EH;
};

class MineCore;
class MineBase: MineCore {
	ACE_FRAG_ADD_EH;
};