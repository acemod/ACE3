class CfgAmmo {
	class BulletCore;
	class BulletBase: BulletCore {
		ACE_damageType = "bullet";
	};
	class ShotgunCore;
	class ShotgunBase: ShotgunCore {
		ACE_damageType = "bullet";
	};
	class Default;
	class Grenade: Default {
		ACE_damageType = "grenade";
	};
	class GrenadeCore: Default {
		ACE_damageType = "grenade";
	};
	class TimeBombCore: Default {
		ACE_damageType = "explosive";
	};
	class FuelExplosion: Default {
		ACE_damageType = "explosive";
	};
	class RocketCore;
	class RocketBase: RocketCore {
		ACE_damageType = "explosive";
	};
	class MissileCore;
	class MissileBase: MissileCore {
		ACE_damageType = "explosive";
	};
	class BombCore: Default {
		ACE_damageType = "explosive";
	};
	class ShellCore;
	class ShellBase: ShellCore {
		ACE_damageType = "shell";
	};

	// Autocannon rounds
	class B_19mm_HE: BulletBase {
		ACE_damageType = "explosive";
	};
	class B_35mm_AA: BulletBase {
		ACE_damageType = "explosive";
	};
};