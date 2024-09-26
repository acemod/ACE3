class CfgWeapons {
    // Man-Portable launchers, rear-facing backblast

    class launch_O_Titan_F;

    class rhs_weap_fim92: launch_O_Titan_F {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.45;
    };

    class Launcher_Base_F;

    class rhs_weap_smaw: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,offset) = 1.3;
    };

    class rhs_weap_maaws: Launcher_Base_F {
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,angle) = 70;
        EGVAR(overpressure,damage) = 0.75;
        EGVAR(overpressure,offset) = 0.95;
    };

    class rhs_weap_M136: Launcher_Base_F {
        EGVAR(overpressure,range) = 10;
        EGVAR(overpressure,angle) = 50;
        EGVAR(overpressure,offset) = 0.9;
    };

    // Missile launchers, rear-facing backblast

    class rhs_weap_stinger_Launcher;
    class rhs_weap_stinger_Launcher_static: rhs_weap_stinger_Launcher {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.2;
    };

    class missiles_titan;
    class Rhs_weap_TOW_Launcher_static: missiles_titan {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,range) = 4;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,offset) = 0.8;
    };

    class rockets_230mm_GAT;
    class rhs_weap_mlrs: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 3.8;
    };

    // Vehicle cannons, forward-facing overpressure

    class mortar_82mm;
    class rhs_mortar_81mm: mortar_82mm {
        EGVAR(overpressure,offset) = 0.2;
    };
};