class CfgMagazines {
    class magazine_Missile_AMRAAM_C_x1;
    class PylonMissile_Missile_AMRAAM_C_x1;
    class PylonRack_Missile_AMRAAM_C_x1;
    class PylonRack_Missile_AMRAAM_C_x2;
    class PylonMissile_Missile_AMRAAM_D_x1;
    class PylonMissile_Missile_AMRAAM_D_INT_x1;
    class PylonRack_Missile_AMRAAM_D_x1;
    class PylonRack_Missile_AMRAAM_D_x2;

    class 4Rnd_GAA_missiles;
    class PylonRack_1Rnd_GAA_missiles;
    class PylonMissile_1Rnd_GAA_missiles;

    class GVAR(a): 4Rnd_GAA_missiles {
        author = "tcvm";
        displayName = CSTRING(a);
        ammo = QGVAR(a);
    };

    class GVAR(PylonRack_1Rnd_a): PylonRack_1Rnd_GAA_missiles {
        author = "tcvm";
        displayName = CSTRING(a_1x);
        ammo = QGVAR(a);
        pylonWeapon = QGVAR(aim120Launcher);
    };

    class GVAR(PylonMissile_1Rnd_a): PylonMissile_1Rnd_GAA_missiles {
        author = "tcvm";
        displayName = CSTRING(a_1x);
        ammo = QGVAR(a);
        pylonWeapon = QGVAR(aim120Launcher);
    };

    // AIM-120
    class GVAR(c): magazine_Missile_AMRAAM_C_x1 {
        author = "tcvm";
        displayName = CSTRING(c_1x);
        ammo = QGVAR(c);
    };
    class GVAR(PylonMissile_Missile_c_x1): PylonMissile_Missile_AMRAAM_C_x1 {
        author = "tcvm";
        displayName = CSTRING(c_1x);
        ammo = QGVAR(c);
        pylonWeapon = QGVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_c_x1): PylonRack_Missile_AMRAAM_C_x1 {
        author = "tcvm";
        displayName = CSTRING(c_1x);
        ammo = QGVAR(c);
        pylonWeapon = QGVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_c_x2): PylonRack_Missile_AMRAAM_C_x2 {
        author = "tcvm";
        displayName = CSTRING(c_2x);
        ammo = QGVAR(c);
        pylonWeapon = QGVAR(aim120Launcher);
    };

    class GVAR(PylonMissile_Missile_d_x1): PylonMissile_Missile_AMRAAM_D_x1 {
        author = "tcvm";
        displayName = CSTRING(d_1x);
        ammo = QGVAR(d);
        pylonWeapon = QGVAR(aim120Launcher);
    };
    class GVAR(PylonMissile_Missile_d_INT_x1): PylonMissile_Missile_AMRAAM_D_INT_x1 {
        author = "tcvm";
        displayName = CSTRING(d_1x);
        ammo = QGVAR(d);
        pylonWeapon = QGVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_d_x1): PylonRack_Missile_AMRAAM_D_x1 {
        author = "tcvm";
        displayName = CSTRING(d_1x);
        ammo = QGVAR(d);
        pylonWeapon = QGVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_d_x2): PylonRack_Missile_AMRAAM_D_x2 {
        author = "tcvm";
        displayName = CSTRING(d_2x);
        ammo = QGVAR(d);
        pylonWeapon = QGVAR(aim120Launcher);
    };

    // R-77
    class magazine_Missile_AA_R77_x1;
    class PylonMissile_Missile_AA_R77_x1;
    class PylonMissile_Missile_AA_R77_INT_x1;
    
    class GVAR(r77): magazine_Missile_AA_R77_x1 {
        author = "tcvm";
        displayName = CSTRING(r77_1x);
        ammo = QGVAR(r77);
    };
    class GVAR(PylonMissile_Missile_R77_x1): PylonMissile_Missile_AA_R77_x1 {
        author = "tcvm";
        displayName = CSTRING(r77_1x);
        ammo = QGVAR(r77);
        pylonWeapon = QGVAR(r77Launcher);
    };
    class GVAR(PylonMissile_Missile_R77__INT_x1): PylonMissile_Missile_AA_R77_INT_x1 {
        author = "tcvm";
        displayName = CSTRING(r77_1x);
        ammo = QGVAR(r77);
        pylonWeapon = QGVAR(r77Launcher);
    };
};

