class CfgWeapons {

    // MACHINE GUNS
    class gm_pk_base;
    class gm_pkm_base: gm_pk_base {
        EGVAR(overheating,mrbs) = 3000;
        EGVAR(overheating,slowdownFactor) = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,dispersion) = 0.25;
        ACE_barrelLength = 645.16;
        ACE_barrelTwist = 240.03;
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
        ACE_barrelLength = 565.15;
        ACE_barrelTwist = 305;
    };
    class gm_mg3_veh_base: gm_mg3_base {
        EGVAR(overheating,allowSwapBarrel) = 0;
    };

    //RIFLES
    class gm_ak74_base: gm_rifle_base {
        ACE_barrelLength = 414.02;
        ACE_barrelTwist = 199.898;
    };
    class gm_rpk74_base: gm_ak74_base {
        ACE_barrelLength = 590;
        ACE_barrelTwist = 195;
    };
    class gm_m16_base: gm_rifle_base {
        ACE_barrelLength = 508;
        ACE_barrelTwist=305;
    };
    class gm_m16a2_base: gm_m16_base {
        ACE_barrelTwist=177.8;
    };
    class gm_svd_base: gm_rifle_base {
        ACE_barrelLength = 619.76;
        ACE_barrelTwist = 238.76;
    };
    class gm_psg1_base: gm_g3_base {
        ACE_barrelLength = 650.24;
        ACE_barrelTwist = 304.8;
    };
    class gm_g3_base: gm_rifle_base {
        ACE_barrelLength = 449.58;
        ACE_barrelTwist = 304.8;
    };
    class gm_g3ka4_base: gm_g3_base {
        ACE_barrelLength = 314.96;
        ACE_barrelTwist = 304.8;
    };
    class gm_ak47_base: gm_rifle_base {
        ACE_barrelLength = 415;
        ACE_barrelTwist = 240;
    };
    class gm_rpk_base: gm_ak47_base {
        ACE_barrelLength = 590;
    };
    class gm_hk33_base: gm_rifle_base {
        ACE_barrelLength = 390;
        ACE_barrelTwist = 177.8;
    };
    class gm_hk53_base: gm_hk33_base {
        ACE_barrelLength = 211;
        ACE_barrelTwist = 177.8;
    };
    class gm_aks74n_base;
    class gm_aks74nk_base: gm_aks74n_base {
        ACE_barrelLength = 317;
    };
    class gm_c7a1_base: gm_m16_base {
        ACE_barrelTwist = 177.8;
    };
    class gm_g11_base;
    class gm_g11k2_base: gm_g11_base {
        ACE_barrelLength = 540;
        ACE_barrelTwist = 154.94;
    };
    class gm_g36_base: gm_rifle_base {
        ACE_barrelLength = 480.06;
        ACE_barrelTwist = 177.8;
    };
    class gm_hk33k_base: gm_hk33_base {
        ACE_barrelLength = 332.74;
    };
    class gm_mpikms72k_base: gm_akmsn_base {
        ACE_barrelLength = 317;
    };
    class gm_msg90_base: gm_psg1_base {
        ACE_barrelLength = 599.44;
        ACE_barrelTwist = 279.4;
    };
    class gm_hk512_base: gm_rifle_base {
        ACE_barrelLength = 460;
        ACE_twistDirection = 0;
    };
    class gm_sg550_base: gm_rifle_base {
        ACE_barrelLength = 528;
        ACE_barrelTwist = 254;
    };
    class gm_sg551_base: gm_sg550_base {
        ACE_barrelLength = 363;
        ACE_barrelTwist = 177.8;
    };
    class gm_sg542_base: gm_sg550_base {
        ACE_barrelLength = 464.82;
        ACE_barrelTwist = 304.8;
    };
    //LAUNCHERS
    class gm_launcher_base;
    class gm_carlgustaf_m2_base: gm_launcher_base {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 60;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,priority) = 1;
        EGVAR(overpressure,range) = 10;
    };
    class gm_rpg7_base: gm_launcher_base {
        EGVAR(reloadlaunchers,enabled) = 1;
    };
    class gm_strela_launcher_base: gm_launcher_base {
        EGVAR(reloadlaunchers,enabled) = 1;
    };
    class gm_fim43_base;
    class gm_fim43_oli: gm_fim43_base {
        EGVAR(reloadlaunchers,enabled) = 1;
    };
    class gm_pzf44_2_base: gm_launcher_base {
        EGVAR(reloadlaunchers,enabled) = 1;
    };

    // SUB MACHINE GUNS
    class gm_mp2_base: gm_rifle_base {
        EGVAR(overheating,closedBolt) = 0;
        ACE_barrelLength = 250;
        ACE_barrelTwist = 254;
    };
    class gm_pm63_base: gm_rifle_base {
        EGVAR(overheating,closedBolt) = 0;
        ACE_barrelLength = 152.4;
        ACE_barrelTwist = 254;
    };
    class gm_mp5_base: gm_rifle_base {
        ACE_barrelLength = 225;
        ACE_barrelTwist = 254;
    };
    class gm_mp5sd_base: gm_mp5_base {
        ACE_barrelLength = 146;
        ACE_barrelTwist = 254;
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

    // PISTOLS
    class gm_p210_base: gm_pistol_base {
        ACE_barrelLength = 120;
        ACE_barrelTwist = 254;
    };
    class gm_pm_base: gm_pistol_base {
        ACE_barrelLength = 93.5;
        ACE_barrelTwist = 260;
    };
    class gm_p1_base: gm_pistol_base {
        ACE_barrelLength = 125;
        ACE_barrelTwist = 254;
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
