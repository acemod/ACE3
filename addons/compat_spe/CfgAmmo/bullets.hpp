class SPE_Bullet_Vehicle_base;

class SPE_B_127x99_Mixed: SubmunitionBase {
    ACE_caliber = 12.954;
    EGVAR(rearm,caliber) = 12.7; // rounded to 13
};

class SPE_B_127x99_Ball: SPE_Bullet_Vehicle_base {
    ACE_caliber = 12.954;
    EGVAR(rearm,caliber) = 12.7;
};
class SPE_B_127x99_API: SPE_B_127x99_Ball {
    EGVAR(vehicle_damage,incendiary) = 1;
};

class SPE_B_75x54_Ball: SPE_Bullet_base {
    EGVAR(rearm,caliber) = 7.5; // rounded to 8
};
class SPE_B_762x63_Ball: SPE_Bullet_base {
    EGVAR(rearm,caliber) = 7.62;
};
class SPE_B_792x57_Ball: SPE_Bullet_base {
    EGVAR(rearm,caliber) = 7.92;
};

// FLAK
class SPE_Bullet_AA_base;
class SPE_SprGr_FlaK_38: SPE_Bullet_AA_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 50;
    EGVAR(frag,charge) = 6;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny", "ACE_frag_small_HD"};
    EGVAR(rearm,caliber) = 20;
};

class SPE_Bullet_AP_base;
class SPE_PzGr_FlaK_38_AP_T: SPE_Bullet_AP_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 50;
    EGVAR(frag,charge) = 6;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny", "ACE_frag_small_HD"};
    EGVAR(rearm,caliber) = 20;
};
