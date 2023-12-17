class BulletBase;
class BulletCore;
class BulletBase_NonAceAB: BulletCore {};
class SPE_Bullet_base: BulletBase {};

class SPE_B_Bayonet: SPE_Bullet_base {
    ACE_damageType = "stab";
};

class SPE_Base_Flamethrower_Ammo: BulletBase_NonAceAB {
    ACE_damageType = QGVAR(explosive_incendiary);
};
