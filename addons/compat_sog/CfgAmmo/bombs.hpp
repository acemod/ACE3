
class BombCore;
class vn_bomb_base_he: BombCore {
    ACE_damageType = "explosive";
};
class vn_bomb_500_blu1b_fb_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_500_mk20_cb_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_500_mk82_dc_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_500_mk82_se_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_500_mk82_he_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_750_m117_he_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_1000_mk83_he_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_2000_mk84_he_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};
class vn_bomb_2000_gbu8_he_ammo: vn_bomb_base_he {
    EGVAR(rearm,caliber) = 250;
};

class Mo_cluster_AP;
class vn_napalm_cluster_bomb_01: Mo_cluster_AP {
    ACE_damageType = QGVAR(explosive_incendiary);
};

class ShellBase;
class sticky_napalm_red_small: ShellBase {
    ACE_damageType = QGVAR(explosive_incendiary);
};
