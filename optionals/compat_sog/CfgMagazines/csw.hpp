class vn_missile_tow_mag_x1;
class GVAR(tow_missile): vn_missile_tow_mag_x1 {
    scope = 2;
    type = 256;
    count = 1;
    model = "\vn\static_f_vietnam\tow\vn_static_tow_mag.p3d";
};

class vn_m1919_v_250_mag;
class GVAR(m1919_250): vn_m1919_v_250_mag {
    scope = 2;
    type = 256;
    count = 250;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\macv\vn_us_30cal.p3d";
    ACE_isBelt = 1;
};

class vn_m60_v_200_mag;
class GVAR(m60_200): vn_m60_v_200_mag {
    scope = 2;
    type = 256;
    count = 200;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\macv\vn_us_can_30.p3d";
    ACE_isBelt = 1;
};

class vn_dshkm_v_50_mag;
class GVAR(dshkm_50): vn_dshkm_v_50_mag {
    scope = 2;
    type = 256;
    count = 50;
    model = "\vn\objects_f_vietnam\supply\a2_ammo\pavn\vn_pavn_50_can.p3d";
    ACE_isBelt = 1;
};
