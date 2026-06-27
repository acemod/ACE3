class SPE_Bullet_Vehicle_base;

// https://jbmballistics.com/cgi-bin/jbmdrag-5.1.cgi - used to calculate ballistic coefficients
// ACE_ammoTempMuzzleVelocityShifts and ACE_standardAtmosphere are unknown in most cases
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

// https://wikimaginot.eu/V70_glossaire_detail.php?id=%201000477
// Balle C
class SPE_B_75x54_Ball: SPE_Bullet_base {
    ACE_caliber = 7.82;
    ACE_bulletLength = 27.3;
    ACE_bulletMass = 9;
    ACE_ballisticCoefficients[] = {0.403};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {820, 850};
    ACE_barrelLengths[] = {500, 575};
    EGVAR(rearm,caliber) = 7.5; // rounded to 8
};
// Balle P
class SPE_B_75x54_35P_AP: SPE_B_75x54_Ball {
    ACE_caliber = 7.78;
    ACE_bulletLength = 32.25;
    ACE_bulletMass = 9.4;
    ACE_ballisticCoefficients[] = {0.223};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {820};
    ACE_barrelLengths[] = {500};
};

// https://books.google.ch/books?id=msoIAQAAIAAJ&pg=PA45&redir_esc=y#v=onepage&q&f=false
// https://forum.cartridgecollectors.org/t/steel-jacketed-30-06s/24016/4
// M2 ball
// https://m1-garand-rifle.com/30-06/
class SPE_B_762x63_Ball: SPE_Bullet_base {
    ACE_caliber = 7.84;
    ACE_bulletLength = 28.52;
    ACE_bulletMass = 9.85;
    ACE_ballisticCoefficients[] = {0.414};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {854.96};
    ACE_barrelLengths[] = {610};
    EGVAR(rearm,caliber) = 7.62;
};
// M1 ball
// https://www.m14forum.com/threads/m72-bullets.539630/
class SPE_B_762x63_Ball_M1: SPE_B_762x63_Ball {
    ACE_caliber = 7.84;
    ACE_bulletLength = 34.85;
    ACE_bulletMass = 11.3;
    ACE_ballisticCoefficients[] = {0.261};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {806.81};
    ACE_barrelLengths[] = {610};
};
// M2 AP
class SPE_B_762x63_Ball_M2_AP: SPE_B_762x63_Ball {
    ACE_caliber = 7.84;
    ACE_bulletLength = 34.8;
    ACE_bulletMass = 10.92;
    ACE_ballisticCoefficients[] = {0.454};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {845.82};
    ACE_barrelLengths[] = {610};
};

// M1 ball
// https://archive.org/details/FM23-7/page/n7/mode/2up
class SPE_B_762x33_Ball: SPE_B_762x63_Ball {
    ACE_caliber = 7.82;
    // ACE_bulletLength = 34.8;
    ACE_bulletMass = 7.13;
    // ACE_ballisticCoefficients[] = {0.454};
    ACE_velocityBoundaries[] = {};
    // ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {579.12};
    ACE_barrelLengths[] = {460};
};

// https://forum.cartridgecollectors.org/t/303-british-mk-viii-and-viiiz/12677/15
// https://303british.com/cartridge-specifications/
// Mk. VII
// https://www.enfield-rifles.com/mk7-ballistic-coefficient_topic10095.html
// https://sites.google.com/site/britmilammo/-303-inch/-303-inch-cordite-ball-mark-vi-to-viiiz?authuser=0
class SPE_B_770x56_Ball: SPE_Bullet_base {
    ACE_caliber = 7.90;
    ACE_bulletLength = 32.23;
    ACE_bulletMass = 11.28;
    ACE_ballisticCoefficients[] = {0.467};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {743.71};
    ACE_barrelLengths[] = {640};
    EGVAR(rearm,caliber) = 7.7;
};
// Mk. I AP
// https://sites.google.com/site/britmilammo/-303-inch/-303-inch-armour-piercing?authuser=0
class SPE_B_770x56_AP_MKI: SPE_B_770x56_Ball {
    ACE_caliber = 7.90;
    ACE_bulletLength = 32.23;
    ACE_bulletMass = 11.28;
    ACE_ballisticCoefficients[] = {0.469};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {762};
    ACE_barrelLengths[] = {640};
};
// Mk. VIII
// https://forum.cartridgecollectors.org/t/303-british-mk-viii-and-viiiz/12677/15
// https://sites.google.com/site/britmilammo/-303-inch/-303-inch-cordite-ball-mark-vi-to-viiiz?authuser=0
class SPE_B_770x56_MkVIII: SPE_B_770x56_Ball {
    ACE_caliber = 7.90;
    ACE_bulletLength = 33.93;
    ACE_bulletMass = 11.34;
    ACE_ballisticCoefficients[] = {0.251};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {743.71};
    ACE_barrelLengths[] = {640};
};

// m.E.
// https://www.thefirearmblog.com/blog/2016/08/18/modern-historical-intermediate-calibers-017-7-92x33mm-kurz/
class SPE_B_792x33_Ball: SPE_Bullet_base {
    ACE_caliber = 8.22;
    // ACE_bulletLength = 32.23;
    ACE_bulletMass = 8.1;
    ACE_ballisticCoefficients[] = {0.132};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {685};
    ACE_barrelLengths[] = {420};
};

// https://web.archive.org/web/20160822032655/http://www.waffen-welt.de/bilder/DiePatrone7.92x57.pdf
// S.m.E
class SPE_B_792x57_Ball: SPE_Bullet_base {
    ACE_caliber = 8.22;
    ACE_bulletLength = 37.3;
    ACE_bulletMass = 11.55;
    ACE_ballisticCoefficients[] = {0.27};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {770};
    ACE_barrelLengths[] = {600};
    EGVAR(rearm,caliber) = 7.92;
};
// S.m.K.
class SPE_B_792x57_Ball_SMK: SPE_B_792x57_Ball {
    ACE_caliber = 8.22;
    ACE_bulletLength = 37.3;
    ACE_bulletMass = 11.55;
    ACE_ballisticCoefficients[] = {0.27};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {785};
    ACE_barrelLengths[] = {600};
};
// s.S.
// https://hbsa-uk.org/knowledge-and-research/hbsa-dvd-index-and-content/hbsa-historic-machine-guns-dvd/mg34-7-92mm-general-purpose-machine-gun/
class SPE_B_792x57_Ball_sS: SPE_B_792x57_Ball {
    ACE_caliber = 8.22;
    ACE_bulletLength = 35.3;
    ACE_bulletMass = 12.8;
    ACE_ballisticCoefficients[] = {0.295};
    ACE_velocityBoundaries[] = {};
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {740, 755, 765, 785};
    ACE_barrelLengths[] = {530, 600, 627, 740};
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
