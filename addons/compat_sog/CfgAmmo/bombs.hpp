
class BombCore;
class vn_bomb_base_he: BombCore {
    ACE_damageType = "explosive";
};

class Mo_cluster_AP;
class vn_napalm_cluster_bomb_01: Mo_cluster_AP {
    ACE_damageType = QGVAR(explosive_incendiary);
};

class ShellBase;
class sticky_napalm_red_small: ShellBase {
    ACE_damageType = QGVAR(explosive_incendiary);
};
