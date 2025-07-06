class SPE_Bullet_Vehicle_base;

class SPE_B_127x99_Mixed: SubmunitionBase {
    ACE_caliber = 12.954;
};

class SPE_B_127x99_Ball: SPE_Bullet_Vehicle_base {
    ACE_caliber = 12.954;
};
class SPE_B_127x99_API: SPE_B_127x99_Ball {
    EGVAR(vehicle_damage,incendiary) = 1;
};

// FLAK
class SPE_Bullet_AA_base;
class SPE_SprGr_FlaK_38: SPE_Bullet_AA_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 50;
    EGVAR(frag,charge) = 6;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny", "ACE_frag_small_HD"};
};

class SPE_Bullet_AP_base;
class SPE_PzGr_FlaK_38_AP_T: SPE_Bullet_AP_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 50;
    EGVAR(frag,charge) = 6;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny", "ACE_frag_small_HD"};
};
