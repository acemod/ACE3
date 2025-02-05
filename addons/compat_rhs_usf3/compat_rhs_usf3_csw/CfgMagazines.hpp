class CfgMagazines {
    // RHS magazines for crew handled ammo
    class rhs_mag_TOW;
    class GVAR(mag_TOW): rhs_mag_TOW {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW_displayName);
        type = 256;
        count = 1;
        mass = 200; // Actually should be 440 but ARMA uses weight and volume in the same number
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOWB;
    class GVAR(mag_TOWB): rhs_mag_TOWB {
        scope = 2;
        displayName = SUBCSTRING(mag_TOWB_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_ITOW;
    class GVAR(mag_ITOW): rhs_mag_ITOW {
        scope = 2;
        displayName = SUBCSTRING(mag_ITOW_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2;
    class GVAR(mag_TOW2): rhs_mag_TOW2 {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW2_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2A;
    class GVAR(mag_TOW2A): rhs_mag_TOW2A {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW2A_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2b;
    class GVAR(mag_TOW2b): rhs_mag_TOW2b {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW2b_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2b_aero;
    class GVAR(mag_TOW2b_aero): rhs_mag_TOW2b_aero {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW2b_aero_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2bb;
    class GVAR(mag_TOW2bb): rhs_mag_TOW2bb {
        scope = 2;
        displayName = SUBCSTRING(mag_TOW2bb_displayName);
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };

    class RHS_48Rnd_40mm_MK19;
    class GVAR(48Rnd_40mm_MK19): RHS_48Rnd_40mm_MK19 {
        scope = 2;
        displayName = SUBCSTRING(48Rnd_40mm_MK19_displayName);
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_48Rnd_40mm_MK19_M430I;
    class GVAR(48Rnd_40mm_MK19_M430I): RHS_48Rnd_40mm_MK19_M430I {
        scope = 2;
        displayName = SUBCSTRING(48Rnd_40mm_MK19_M430I_displayName);
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_48Rnd_40mm_MK19_M430A1;
    class GVAR(48Rnd_40mm_MK19_M430A1): RHS_48Rnd_40mm_MK19_M430A1 {
        scope = 2;
        displayName = SUBCSTRING(48Rnd_40mm_MK19_M430A1_displayName);
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_48Rnd_40mm_MK19_M1001;
    class GVAR(48Rnd_40mm_MK19_M1001): RHS_48Rnd_40mm_MK19_M1001 {
        scope = 2;
        displayName = SUBCSTRING(48Rnd_40mm_MK19_M1001_displayName);
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
};
