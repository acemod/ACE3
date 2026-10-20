// Flamethrower fuel
class vn_m10_ammo: GrenadeBase {
    EGVAR(rearm,caliber) = 6; // pseudo-caliber
};

// Bullets
class vn_riflebullet_base;
class vn_762x39: vn_riflebullet_base {
    EGVAR(rearm,caliber) = 7.62; // rounded to 8
};
class vn_762x51: vn_riflebullet_base {
    EGVAR(rearm,caliber) = 7.62;
};
class vn_762x54: vn_riflebullet_base {
    EGVAR(rearm,caliber) = 7.62;
};
class vn_762x63: vn_riflebullet_base {
    EGVAR(rearm,caliber) = 7.62;
};
class vn_792x33;
class vn_792x57: vn_792x33 {
    EGVAR(rearm,caliber) = 7.62;
};
class vn_127x99: vn_riflebullet_base {
    EGVAR(rearm,caliber) = 12.7;
};

// 20 mm AA rounds
class vn_20x110: BulletBase {
    EGVAR(rearm,caliber) = 20;
};

// 40 mm AA rounds
class vn_40x311: vn_20x110 {
    EGVAR(rearm,caliber) = 40;
};

// 85 mm field artillery
class Sh_155mm_AMOS;
class vn_shell_85mm_base_he_ammo: Sh_155mm_AMOS {
    EGVAR(rearm,caliber) = 82;
};
class vn_shell_heat_base;
class vn_shell_85mm_d44_heat_ammo: vn_shell_heat_base {
    EGVAR(rearm,caliber) = 82;
};
class vn_shell_105mm_m1_he_ammo;
class vn_shell_85mm_d44_hvap_ammo: vn_shell_105mm_m1_he_ammo {
    EGVAR(rearm,caliber) = 82;
};

// 75 mm recoilless gun rounds
class Sh_120mm_HE;
class vn_missile_type56_heat: Sh_120mm_HE {
    EGVAR(rearm,caliber) = 75;
};

// 106 mm recoilless gun rounds
class vn_m40a1rr_shell_apers: Sh_120mm_HE {
    EGVAR(rearm,caliber) = 105;
};
class vn_m40a1rr_shell_hept: Sh_120mm_HE {
    EGVAR(rearm,caliber) = 105;
};
class Sh_120mm_HEAT_MP;
class vn_m40a1rr_shell_heat: Sh_120mm_HEAT_MP {
    EGVAR(rearm,caliber) = 105;
};

// 105 mm howitzer/AT gun rounds
class vn_sh_105mm_base_he_ammo: vn_shell_85mm_base_he_ammo {
    EGVAR(rearm,caliber) = 105;
};
class vn_shell_105mm_m67_heat_ammo: vn_shell_heat_base {
    EGVAR(rearm,caliber) = 105;
};
class Flare_82mm_AMOS_White;
class vn_shell_105mm_m314_lume_ammo: Flare_82mm_AMOS_White {
    EGVAR(rearm,caliber) = 105;
};
class Smoke_120mm_AMOS_White;
class vn_shell_105mm_m60_chem_ammo: Smoke_120mm_AMOS_White {
    EGVAR(rearm,caliber) = 105;
};

// 76 mm tank shells
class Sh_120mm_APFSDS;
class vn_sh_76mm_hvapdst: Sh_120mm_APFSDS {
    EGVAR(rearm,caliber) = 76;
};
class vn_sh_76mm_he: Sh_120mm_HE {
    EGVAR(rearm,caliber) = 76;
};

// 85 mm tank shells
class vn_sh_762mm_aphet;
class vn_sh_85mm_aphe: vn_sh_762mm_aphet {
    EGVAR(rearm,caliber) = 85;
};
class vn_sh_85mm_aphet: vn_sh_762mm_aphet {
    EGVAR(rearm,caliber) = 85;
};
class vn_sh_762mm_he;
class vn_sh_85mm_he: vn_sh_762mm_he {
    EGVAR(rearm,caliber) = 85;
};
class vn_sh_76mm_heat;
class vn_sh_85mm_heatfs: vn_sh_76mm_heat {
    EGVAR(rearm,caliber) = 85;
};
class vn_sh_85mm_hvapt: vn_sh_76mm_hvapdst {
    EGVAR(rearm,caliber) = 85;
};
class vn_sh_762mm_wp;
class vn_sh_85mm_wp: vn_sh_762mm_wp {
    EGVAR(rearm,caliber) = 85;
};

// 90 mm tank shells
class vn_sh_90mm_apc: vn_sh_85mm_aphe {
    EGVAR(rearm,caliber) = 90;
};
class vn_sh_76mm_can;
class vn_sh_90mm_can: vn_sh_76mm_can {
    EGVAR(rearm,caliber) = 90;
};
class vn_sh_90mm_he: vn_sh_85mm_he {
    EGVAR(rearm,caliber) = 90;
};
class vn_sh_90mm_heat: vn_sh_85mm_heatfs {
    EGVAR(rearm,caliber) = 90;
};
class vn_sh_90mm_hvapt: vn_sh_85mm_hvapt {
    EGVAR(rearm,caliber) = 90;
};
class vn_sh_90mm_wp: vn_sh_85mm_wp {
    EGVAR(rearm,caliber) = 90;
};

// 100 mm tank shells
class vn_sh_100mm_aphe: vn_sh_85mm_aphe {
    EGVAR(rearm,caliber) = 100;
};
class vn_sh_100mm_he: vn_sh_85mm_he {
    EGVAR(rearm,caliber) = 100;
};
class vn_sh_100mm_heatfs: vn_sh_85mm_heatfs {
    EGVAR(rearm,caliber) = 100;
};
class vn_sh_100mm_hvapt: vn_sh_85mm_hvapt {
    EGVAR(rearm,caliber) = 100;
};

// 81 mm mortar shells
class Sh_82mm_AMOS;
class vn_sh_81mm_base_he_ammo: Sh_82mm_AMOS {
    EGVAR(rearm,caliber) = 82;
};
class Smoke_82mm_AMOS_White;
class vn_shell_81mm_m57_fs_ammo: Smoke_82mm_AMOS_White {
    EGVAR(rearm,caliber) = 82;
};
class vn_shell_81mm_m301a3_lume_ammo: Flare_82mm_AMOS_White {
    EGVAR(rearm,caliber) = 82;
};

// 82 mm mortar shells
class vn_sh_155mm_amos;
class vn_sh_82mm_amos: vn_sh_155mm_amos {
    EGVAR(rearm,caliber) = 82;
};

// 60 mm mortar shells
class vn_sh_60mm_base_he_ammo: vn_sh_81mm_base_he_ammo {
    EGVAR(rearm,caliber) = 60;
};
class vn_shell_60mm_m83_lume_ammo: Flare_82mm_AMOS_White {
    EGVAR(rearm,caliber) = 60;
};

// 230 mm rocket launcher
class SubmunitionBase;
class vn_missile_type63_he: SubmunitionBase {
    EGVAR(rearm,caliber) = 230;
};
