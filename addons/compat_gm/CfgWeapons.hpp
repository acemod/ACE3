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

    //Fire Protection
    class gm_ge_ff_uniform_man_80_base;
    class gm_ge_army_uniform_pilot_base;
    class gm_ge_army_uniform_pilot_rolled_base;
    class gm_ge_uniform_pilot_commando_base;
    class gm_ge_uniform_crew_base;
    class gm_ge_uniform_pilot_commando_rolled_base;
    class gm_gc_uniform_pilot_80_base;

    //Cold War gear has values reduced by 0.2 from modern gear

    //Firefighter
    class gm_ge_ff_uniform_man_80_orn: gm_ge_ff_uniform_man_80_base {
        ace_fire_protection = 0.5; 
    };

    //Pilot/Tanker Coveralls 80s
    class gm_ge_army_uniform_crew_80_oli: gm_ge_uniform_crew_base {
        ace_fire_protection = 0.3;
    };

    class gm_gc_civ_uniform_pilot_80_blk: gm_gc_uniform_pilot_80_base {
        ace_fire_protection = 0.3;
    };
    class gm_gc_airforce_uniform_pilot_80_blu: gm_gc_uniform_pilot_80_base {
        ace_fire_protection = 0.3;
    };
        class gm_pl_airforce_uniform_pilot_80_gry: gm_gc_uniform_pilot_80_base {
        ace_fire_protection = 0.3;
    };

    //Pilot / Tanker Coveralls 90s
    class gm_ge_uniform_pilot_commando_blk: gm_ge_uniform_pilot_commando_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_uniform_pilot_commando_gry: gm_ge_uniform_pilot_commando_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_uniform_pilot_commando_oli: gm_ge_uniform_pilot_commando_base {
        ace_fire_protection = 0.5;
    };

    //rolled up sleeves reduce effectivenes of fire protection
    class gm_ge_uniform_pilot_commando_rolled_blk: gm_ge_uniform_pilot_commando_rolled_base {
        ace_fire_protection = 0.4;
    };
    class gm_ge_uniform_pilot_commando_rolled_gry: gm_ge_uniform_pilot_commando_rolled_base {
        ace_fire_protection = 0.4;
    };
    class gm_ge_uniform_pilot_commando_rolled_oli: gm_ge_uniform_pilot_commando_rolled_base {
        ace_fire_protection = 0.4;
    };
    class gm_ge_army_uniform_crew_90_trp: gm_ge_uniform_crew_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_army_uniform_crew_90_flk: gm_ge_uniform_crew_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_pol_uniform_pilot_grn: gm_ge_army_uniform_pilot_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_pol_uniform_pilot_rolled_grn: gm_ge_army_uniform_pilot_rolled_base {
        ace_fire_protection = 0.4;
    };
    class gm_ge_army_uniform_pilot_oli: gm_ge_army_uniform_pilot_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_army_uniform_pilot_rolled_oli: gm_ge_army_uniform_pilot_rolled_base {
        ace_fire_protection = 0.4;
    };
    class gm_ge_army_uniform_pilot_sar: gm_ge_army_uniform_pilot_base {
        ace_fire_protection = 0.5;
    };
    class gm_ge_army_uniform_pilot_rolled_sar: gm_ge_army_uniform_pilot_rolled_base {
        ace_fire_protection = 0.4;
    };
};
