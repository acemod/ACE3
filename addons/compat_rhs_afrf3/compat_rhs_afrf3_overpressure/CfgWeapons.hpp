class CfgWeapons {
    // Man-Portable launchers, rear-facing overpressure

    class Launcher_Base_F;
    class rhs_weap_rpg7: Launcher_Base_F {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,offset) = 0.9;
    };

    class rhs_weap_rpg26: Launcher_Base_F {
        EGVAR(overpressure,range) = 10;
        EGVAR(overpressure,angle) = 50;
        EGVAR(overpressure,offset) = 0.65;
    };

    class rhs_weap_rpg18: rhs_weap_rpg26 {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,offset) = 1;
    };

    class rhs_weap_strela;
    class rhs_weap_igla: rhs_weap_strela {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.65;
    };

    // Vehicle recoilless rifles and missile launchers, rear-facing overpressure

    class missiles_titan_static;
    class rhs_Igla_AA_pod_Base: missiles_titan_static { // Soft-launched Igla missile
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.8;
    };

    class RocketPods;
    class rhs_weap_SPG9: RocketPods {
        EGVAR(overpressure,offset) = 1.2;
    };

    // Vehicle cannons, forward-facing overpressure

    class rhs_weap_d81;
    class rhs_weap_2a70: rhs_weap_d81 { // "Low pressure" 100mm cannon
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 0.5;
    };
    class cannon_120mm;
    class rhs_weap_2a28_base: cannon_120mm { // "Low pressure"
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 0.5;
    };
};
