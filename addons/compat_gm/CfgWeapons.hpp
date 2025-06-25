class CfgWeapons {

    // MACHINE GUNS
    class gm_pk_base;
    class gm_pkm_base: gm_pk_base {
        EGVAR(overheating,mrbs) = 3000;
        EGVAR(overheating,slowdownFactor) = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,dispersion) = 0.25;
    };
    class gm_rifle_base;
    class gm_machineGun_base: gm_rifle_base {
        EGVAR(overheating,closedBolt) = 0;
    };
    class gm_mg3_base: gm_machineGun_base {
        EGVAR(overheating,mrbs) = 3000;
        EGVAR(overheating,slowdownFactor) = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,dispersion) = 0.25;
    };
    class gm_mg3_veh_base: gm_mg3_base {
        EGVAR(overheating,allowSwapBarrel) = 0;
    };
    class gm_launcher_base;
    class gm_carlgustaf_m2_base: gm_launcher_base {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 60;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,priority) = 1;
        EGVAR(overpressure,range) = 10;
    };

    // SUB MACHINE GUNS
    class gm_mp2_base: gm_rifle_base {
        EGVAR(overheating,closedBolt) = 0;
    };
    class gm_pm63_base: gm_rifle_base {
        EGVAR(overheating,closedBolt) = 0;
    };

    // GRENADE LAUNCHERS
    class gm_hk69a1_base: gm_rifle_base {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };
    class gm_pallad_d_base: gm_rifle_base {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };

    // FLARE GUNS
    class gm_pistol_base;
    class gm_lp1_base: gm_pistol_base {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };
    class gm_p2a1_base: gm_pistol_base {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };

    class gm_RocketLauncher_base;
    class gm_mlrs_122mm_launcher_base: gm_RocketLauncher_base {
        EGVAR(overpressure,offset) = 3;
    };
};
