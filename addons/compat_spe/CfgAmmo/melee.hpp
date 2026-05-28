class BulletBase_NonAceAB;
class SPE_Bullet_base;

class SPE_B_Bayonet: SPE_Bullet_base {
    ACE_damageType = "stab";
};

class SPE_Base_Flamethrower_Ammo: BulletBase_NonAceAB {
    ACE_damageType = QGVAR(explosive_incendiary);
};
