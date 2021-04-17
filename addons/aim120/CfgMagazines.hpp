class CfgMagazines {
    class magazine_Missile_AMRAAM_C_x1;
    class PylonMissile_Missile_AMRAAM_C_x1;
    class PylonRack_Missile_AMRAAM_C_x1;
    class PylonRack_Missile_AMRAAM_C_x2;
    class PylonMissile_Missile_AMRAAM_D_x1;
    class PylonMissile_Missile_AMRAAM_D_INT_x1;
    class PylonRack_Missile_AMRAAM_D_x1;
    class PylonRack_Missile_AMRAAM_D_x2;

    // AIM-120
    class GVAR(c): magazine_Missile_AMRAAM_C_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120C [ACE]";
        ammo = QGVAR(c);
    };
    class GVAR(PylonMissile_Missile_c_x1): PylonMissile_Missile_AMRAAM_C_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120C [ACE]";
        ammo = QGVAR(c);
        pylonWeapon = GVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_c_x1): PylonRack_Missile_AMRAAM_C_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120C [ACE]";
        ammo = QGVAR(c);
        pylonWeapon = GVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_c_x2): PylonRack_Missile_AMRAAM_C_x2 {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-120C [ACE]";
        ammo = QGVAR(c);
        pylonWeapon = GVAR(aim120Launcher);
    };

    class GVAR(PylonMissile_Missile_d_x1): PylonMissile_Missile_AMRAAM_D_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120D [ACE]";
        ammo = QGVAR(d);
        pylonWeapon = GVAR(aim120Launcher);
    };
    class GVAR(PylonMissile_Missile_d_INT_x1): PylonMissile_Missile_AMRAAM_D_INT_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120D [ACE]";
        ammo = QGVAR(d);
        pylonWeapon = GVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_d_x1): PylonRack_Missile_AMRAAM_D_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-120D [ACE]";
        ammo = QGVAR(d);
        pylonWeapon = GVAR(aim120Launcher);
    };
    class GVAR(PylonRack_Missile_d_x2): PylonRack_Missile_AMRAAM_D_x2 {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-120D [ACE]";
        ammo = QGVAR(d);
        pylonWeapon = GVAR(aim120Launcher);
    };

    // R-77
    class magazine_Missile_AA_R77_x1;
    class PylonMissile_Missile_AA_R77_x1;
    class PylonMissile_Missile_AA_R77_INT_x1;
    
    class GVAR(r77): magazine_Missile_AA_R77_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x R77 [ACE]";
        ammo = QGVAR(r77);
    };
    class GVAR(PylonMissile_Missile_R77_x1): PylonMissile_Missile_AA_R77_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x R77 [ACE]";
        ammo = QGVAR(r77);
        pylonWeapon = QGVAR(r77Launcher);
    };
    class GVAR(PylonMissile_Missile_R77__INT_x1): PylonMissile_Missile_AA_R77_INT_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x R77 [ACE]";
        ammo = QGVAR(r77);
        pylonWeapon = QGVAR(r77Launcher);
    };
};

