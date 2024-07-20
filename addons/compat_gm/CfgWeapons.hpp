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

    // HELMETS
    class gm_ge_headgear_headset_crew_base;
    class gm_ge_headgear_headset_crew_oli: gm_ge_headgear_headset_crew_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_ge_headgear_sph4_base;
    class gm_ge_headgear_sph4_oli: gm_ge_headgear_sph4_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_pl_headgear_wz63_base;
    class gm_pl_army_headgear_wz63_oli: gm_pl_headgear_wz63_base {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_pl_army_headgear_wz63_net_oli: gm_pl_headgear_wz63_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_ge_headgear_crewhat_80_base;
    class gm_ge_headgear_crewhat_80_blk: gm_ge_headgear_crewhat_80_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_gc_headgear_crewhat_80_base;
    class gm_gc_army_headgear_crewhat_80_blk: gm_gc_headgear_crewhat_80_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_gc_headgear_zsh3_base;
    class gm_gc_headgear_zsh3_wht: gm_gc_headgear_zsh3_base {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_gc_headgear_zsh3_blu: gm_gc_headgear_zsh3_base {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_gc_headgear_zsh3_orn: gm_gc_headgear_zsh3_base {
        HEARING_PROTECTION_PELTOR;
    };

    class gm_ge_headgear_beret_crew_bdx;
    class gm_ge_headgear_beret_crew_blk;
    class gm_ge_headgear_beret_crew_grn;
    class gm_ge_headgear_beret_crew_red;
    class gm_ge_headgear_beret_crew_red_antiair: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_blk_antitank: gm_ge_headgear_beret_crew_blk {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_blk_armor: gm_ge_headgear_beret_crew_blk {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_blk_armorrecon: gm_ge_headgear_beret_crew_blk {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_artillery: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_engineer: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_maintenance: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_grn_mechinf: gm_ge_headgear_beret_crew_grn {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_militarypolice: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_nbc: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_opcom: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_bdx_paratrooper: gm_ge_headgear_beret_crew_bdx {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_blk_recon: gm_ge_headgear_beret_crew_blk {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_supply: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
    class gm_ge_headgear_beret_crew_red_signals: gm_ge_headgear_beret_crew_red {
        HEARING_PROTECTION_PELTOR;
    };
};
