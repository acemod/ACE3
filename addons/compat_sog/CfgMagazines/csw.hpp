class vn_missile_tow_mag_x1;
class GVAR(tow_missile): vn_missile_tow_mag_x1 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\tow\vn_static_tow_mag.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_tow_ca.paa);
    mass = 220;  // to Arma, weight and volume are all the same which makes real life values unusable
};

// --- Gun Turrets -------------------------------------------------------------

class vn_m1919_v_250_mag;
class GVAR(m1919_250): vn_m1919_v_250_mag {
    scope = 2;
    scopeArsenal = 2;
    type = 256;
    count = 250;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\macv\vn_us_30cal.p3d";
    picture = QPATHTOF(UI\ammo_250rnd_30cal_ca.paa);
    ACE_isBelt = 1;
    mass = 170;
};

class vn_m60_v_200_mag;
class GVAR(m60_200): vn_m60_v_200_mag {
    scope = 2;
    type = 256;
    count = 200;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\macv\vn_us_can_30.p3d";
    picture = QPATHTOF(UI\ammo_200rnd_762mm_ca.paa);
    ACE_isBelt = 1;
    mass = 187;
};

class vn_dshkm_v_50_mag;
class GVAR(dshkm_50): vn_dshkm_v_50_mag {
    scope = 2;
    type = 256;
    count = 50;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\pavn\vn_pavn_50_can.p3d";
    picture = QPATHTOF(UI\ammo_50rnd_127mm_ca.paa);
    ACE_isBelt = 1;
    mass = 170;
};

class vn_mg42_v_250_mag;
class GVAR(mg42_250): vn_mg42_v_250_mag {
    scope = 2;
    type = 256;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\pavn\vn_pavn_30_can.p3d";
    picture = "\vn\weapons_f_vietnam\ui\icon_vn_pk_100_mag_ca.paa";
    ACE_isBelt = 1;
    mass = 160;
};

class vn_sgm_v_250_mag;
class GVAR(sgm_250): vn_sgm_v_250_mag {
    scope = 2;
    type = 256;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\pavn\vn_pavn_30_can.p3d";
    picture = "\vn\weapons_f_vietnam\ui\icon_vn_pk_100_mag_ca.paa";
    ACE_isBelt = 1;
    mass = 160;
};

class vn_mk18_v_24_mag;
class GVAR(mk18_24): vn_mk18_v_24_mag {
    scope = 2;
    type = 256;
    model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
    picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    mass = 160;
};

class vn_mk18_v_48_mag;
class GVAR(mk18_48): vn_mk18_v_48_mag {
    scope = 2;
    type = 256;
    model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
    picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    mass = 220;
};

// --- Mortars -----------------------------------------------------------------

class vn_mortar_m29_mag_he_x8;
class GVAR(81mm_he): vn_mortar_m29_mag_he_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m29\vn_shell_81mm_m374_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_81mm_ca.paa);
    mass = 91;
    displayName = CSTRING(Magazine_81mm_HE);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m29_mag_wp_x8;
class GVAR(81mm_wp): vn_mortar_m29_mag_wp_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m29\vn_shell_81mm_m374_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_81mm_ca.paa);
    mass = 91;
    displayName = CSTRING(Magazine_81mm_WP);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m29_mag_chem_x8;
class GVAR(81mm_chem): vn_mortar_m29_mag_chem_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m29\vn_shell_81mm_m374_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_81mm_ca.paa);
    mass = 91;
    displayName = CSTRING(Magazine_81mm_Smoke);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m29_mag_lume_x8;
class GVAR(81mm_lume): vn_mortar_m29_mag_lume_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m29\vn_shell_81mm_m374_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_81mm_ca.paa);
    mass = 91;
    displayName = CSTRING(Magazine_81mm_Lume);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m2_mag_he_x8;
class GVAR(60mm_he): vn_mortar_m2_mag_he_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m2\vn_shell_60mm_m49a2_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_60mm_ca.paa);
    mass = 37;
    displayName = CSTRING(Magazine_60mm_HE);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m2_mag_wp_x8;
class GVAR(60mm_wp): vn_mortar_m2_mag_wp_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m2\vn_shell_60mm_m302_wp_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_60mm_ca.paa);
    mass = 37;
    displayName = CSTRING(Magazine_60mm_WP);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_m2_mag_lume_x8;
class GVAR(60mm_lume): vn_mortar_m2_mag_lume_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_m2\vn_shell_60mm_m83_lume_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_60mm_ca.paa);
    mass = 37;
    displayName = CSTRING(Magazine_60mm_Lume);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_type53_mag_he_x8;
class GVAR(82mm_he): vn_mortar_type53_mag_he_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_type53\vn_shell_82mm_o832d_he_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_82mm_ca.paa);
    mass = 70;
    displayName = CSTRING(Magazine_82mm_HE);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_type53_mag_wp_x8;
class GVAR(82mm_wp): vn_mortar_type53_mag_wp_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_type53\vn_shell_82mm_d832_wp_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_82mm_ca.paa);
    mass = 70;
    displayName = CSTRING(Magazine_82mm_WP);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};

class vn_mortar_type53_mag_lume_x8;
class GVAR(82mm_lume): vn_mortar_type53_mag_lume_x8 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\mortar_type53\vn_shell_82mm_s832s_lume_ammo.p3d";
    picture = QPATHTOF(UI\ammo_1rnd_82mm_ca.paa);
    mass = 70;
    displayName = CSTRING(Magazine_82mm_Lume);
    displayNameShort = "";
    descriptionShort = ECSTRING(mk6mortar,magazine_descriptionShort);
};
