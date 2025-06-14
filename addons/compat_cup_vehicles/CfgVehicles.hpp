class CfgVehicles {
    class CUP_nHMMWV_Base;
    class CUP_nM1025_SOV_Base: CUP_nHMMWV_Base {
        class EGVAR(interaction,anims) {
            class hide_backpacks {
                positions[] = {
                    "(_target selectionPosition ['vhc_backpacks', 'ViewGeometry', 'AveragePoint']) vectorAdd [-1, 0, 0]",
                    "(_target selectionPosition ['vhc_backpacks', 'ViewGeometry', 'AveragePoint']) vectorAdd [1.3, 0, 0]"
                };
                items[] = {"CUP_B_USPack_Coyote", "CUP_B_USPack_Coyote", "CUP_B_AssaultPack_ACU", "CUP_B_AssaultPack_ACU", "CUP_B_AssaultPack_Coyote"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };

    class Car_F;
    class CUP_ECVHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_deploy2 {
                positions[] = {"(_target selectionPosition ['vhc_rear_trunk_door', 'FireGeometry', 'AveragePoint']) vectorAdd [-0.7, 0, 0]"};
                items[] = {"CUP_B_USPack_Coyote", "CUP_B_AssaultPack_ACU"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };

    class CUP_Hilux_Base;
    class CUP_Hilux_MLRS_Base: CUP_Hilux_Base {
        EGVAR(overpressure,noReflection) = 1;
    };
    class CUP_Hilux_UB32_Base: CUP_Hilux_Base {
        EGVAR(overpressure,noReflection) = 1;
    };

    class CUP_Ural_BaseTurret;
    class CUP_BM21_Base: CUP_Ural_BaseTurret {
        EGVAR(overpressure,noReflection) = 1;
    };

    class CUP_MTVR_Base;
    class CUP_MTVR_Reammo_Base: CUP_MTVR_Base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class CUP_V3S_Open_Base;
    class CUP_V3S_Rearm_Base: CUP_V3S_Open_Base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class CUP_Kamaz_5350_Base;
    class CUP_Kamaz_5350_ReAmmo_Base: CUP_Kamaz_5350_Base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class CUP_T810_Unarmed_Base;
    class CUP_T810_Reammo_Base: CUP_T810_Unarmed_Base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class Wheeled_APC_F;
    class CUP_BTR80_Common_Base: Wheeled_APC_F {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.734863, 0.143927, -0.291199};
                camAttach = 45;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.950684, -0.00122738, -0.344391};
                camAttach = 90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {0.932129, -0.729811, -0.319};
                camAttach = 90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_3 {
                camLocation[] = {-0.963379, -0.749183, -0.351501};
                camAttach = -90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_4 {
                camLocation[] = {-0.973145, 0.0148516, -0.364868};
                camAttach = -90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.73584, 0.119176, -0.291229};
                camAttach = -45;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
        };
    };
    class CUP_BTR90_Base: Wheeled_APC_F {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.533417, 2.4613, -0.309951};
                camAttach = 0;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.877106, 2.38684, -0.306068};
                camAttach = 30;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {1.04312, 0.0909424, -0.281996};
                camAttach = 60;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_3 {
                type = "";
                camLocation[] = {1.03799, -0.928223, -0.282196};
                camAttach = 80;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_4 {
                type = "";
                camLocation[] = {-0.90097, -0.913086, -0.282192};
                camAttach = -80;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_5 {
                type = "";
                camLocation[] = {-0.939301, 0.109985, -0.281992};
                camAttach = -60;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
        };
    };
    class CUP_BTR90_HQ_Base: CUP_BTR90_Base { delete ace_viewports; }; // no cargo seats

    class CUP_GAZ_Vodnik_Base: Wheeled_APC_F {
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,engineFireProb) = 0.1;
    };
    class CUP_GAZ_Vodnik_AGS_Base: CUP_GAZ_Vodnik_Base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(vehicle_damage,canHaveFireJet) = 0;
    };
    class CUP_GAZ_Vodnik_Unarmed_base: CUP_GAZ_Vodnik_Base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(vehicle_damage,canHaveFireJet) = 0;
    };
    class CUP_GAZ_Vodnik_MedEvac_Base: CUP_GAZ_Vodnik_Base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(vehicle_damage,canHaveFireJet) = 0;
    };
    class CUP_O_GAZ_Vodnik_PK_RU: CUP_GAZ_Vodnik_Base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(vehicle_damage,canHaveFireJet) = 0;
    };

    class CUP_LAV25_Base: Wheeled_APC_F {
        ace_hunterkiller = 1;
    };

    class CUP_B_LAV25_USMC;
    class CUP_B_LAV25_HQ_USMC: CUP_B_LAV25_USMC {
        delete ace_hunterkiller; // no turret
    };

    class Tank_F;
    class CUP_M270_HE_Base: Tank_F {
        EGVAR(overpressure,noReflection) = 1;
    };
    class CUP_AAV_Base: Tank_F {
        class EGVAR(interaction,anims) {
            class Hide_Bags_Deployment {
                positions[] = {{1.7, -0.7, -0.3}, {1.7, -2.55, -0.3}};
                items[] = {"CUP_B_USPack_Coyote", "CUP_B_USPack_Coyote"};
                name = "$STR_CUP_dn_USpack_coyote";
                text = "$STR_CUP_dn_USpack_coyote";
            };
        };
    };

    class CUP_BMP3_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_FV510_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_MCV80_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_leopard_1A3_base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_M2Bradley_Base: Tank_F {
        ace_hunterkiller = 1;
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.987915, -0.324707, -0.0673385};
                camAttach = 70;
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.90979, -0.970215, -0.043139};
                camAttach = 120;
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {0.328003, -1.87402, -0.0408039};
                camAttach = 160;
                roles[]={"cargo"};
            };
            class view_3 {
                camLocation[] = {-0.357178, -1.89063, -0.0480237};
                camAttach = 175;
                roles[]={"cargo"};
            };
            class view_4 {
                camLocation[] = {-0.752075, -1.87061, -0.0522318};
                camAttach = 190;
                roles[]={"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.936401, -0.0942383, -0.107764};
                camAttach = -75;
                roles[]={"cargo"};
            };
            class SLD { // suppose to only be only on A3, but the A2s have the screen on the model?
                screenLocation[] = {0.729126,-0.191597,-0.573349};
                maxDistance = 5;
                type = "screen";
                camLocation[] = {0,0,0.05};
                camAttach[] = {0,0};
                roles[]={"cargo"};
            };
        };
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l1", "hitera_l2", "hitera_l3", "hitera_l4", "hitera_l5",
            "hitera_l6", "hitera_l7", "hitera_l8", "hitera_r1", "hitera_r2",
            "hitera_r3", "hitera_r4", "hitera_r5", "hitera_r6", "hitera_r7",
            "hitera_r8", "hitera_t1", "hitera_t2", "hitera_t3", "hitera_t4",
            "hitera_t5", "hitera_t6", "hitera_t7", "hitera_t8", "hitera_fr1",
            "hitera_fr2", "hitera_fr3", "hitera_fr4", "hitera_fr5", "hitera_fr6",
            "hitera_fr7", "hitera_fr8", "hitera_fr9", "hitera_fl1", "hitera_fl2",
            "hitera_fl3", "hitera_fl4", "hitera_fl5"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {};
    };

    class CUP_Challenger2_base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_M60A3_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_T55_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_T72_Base: Tank_F {
        ace_hunterkiller = 1;
    };

    class CUP_T90_Base: Tank_F {
        ace_hunterkiller = 1;
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l1", "hitera_l2", "hitera_l3", "hitera_r1", "hitera_r2",
            "hitera_r3", "hitera_1_t_l", "hitera_1_t_r", "hitera_2_t_l",
            "hitera_2_t_r"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {};
    };
    class CUP_T90M_Base: Tank_F {
        ace_hunterkiller = 1;
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_t1", "hitera_t2", "hitera_t3", "hitera_t4", "hitera_t5",
            "hitera_t6", "hitera_t7", "hitera_t8", "hitera_t9", "hitera_t10",
            "hitera_t11", "hitera_t12", "hitera_t13", "hitera_t14", "hitera_t15",
            "hitera_t16", "hitera_t17", "hitera_t18", "hitera_t19", "hitera_t20",
            "hitera_t21", "hitera_f1", "hitera_f2", "hitera_f3", "hitera_f4",
            "hitera_f5", "hitera_f6", "hitera_f7", "hitera_s1", "hitera_s2",
            "hitera_s3", "hitera_s4", "hitera_s5", "hitera_s6", "hitera_s7",
            "hitera_s8", "hitera_s9", "hitera_s10", "hitera_s11", "hitera_s12",
            "hitera_t22", "hitera_t23", "hitera_t24", "hitera_t25", "hitera_t26",
            "hitera_t27", "hitera_t28", "hitera_t29", "hitera_t30", "hitera_t31",
            "hitera_t32", "hitera_t33"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "hitslat_left", "hitslat_right", "hitslat_turret_rear",
            "hitslat_turret_left", "hitslat_rear"
        };
    };

    class CUP_T72_ACR_Base: CUP_T72_Base {};
    class CUP_B_T72_CZ: CUP_T72_ACR_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_top_l1", "hitera_top_l2", "hitera_top_l3", "hitera_top_l4",
            "hitera_top_r1", "hitera_top_r2", "hitera_top_r3", "hitera_top_r4",
            "hitera_front_r1", "hitera_front_r2", "hitera_front_l1",
            "hitera_front_l2", "hitera_top_rear"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {};
    };

    class CUP_Leopard2_Base: Tank_F {
        ace_hunterkiller = 1;
    };
    class CUP_Leopard2_ERA_Base: CUP_Leopard2_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_1", "hitera_2", "hitera_3", "hitera_4", "hitera_5", "hitera_6",
            "hitera_7", "hitera_8", "hitera_9", "hitera_10", "hitera_11", "hitera_12",
            "hitera_13", "hitera_14", "hitera_15", "hitera_16", "hitera_17", "hitera_18",
            "hitera_19", "hitera_20", "hitera_21", "hitera_22", "hitera_23", "hitera_24",
            "hitera_25", "hitera_26", "hitera_27", "hitera_28", "hitera_29", "hitera_30",
            "hitera_31", "hitera_32", "hitera_33", "hitera_34", "hitera_35", "hitera_36",
            "hitera_37", "hitera_38", "hitera_39", "hitera_40", "hitera_41", "hitera_42",
            "hitera_43", "hitera_44", "hitera_45", "hitera_46", "hitera_47"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {};
    };

    class CUP_M1_Abrams_base: Tank_F {
        ace_hunterkiller = 1;
    };
    class CUP_M1A2_TUSK_base: CUP_M1_Abrams_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l1", "hitera_l2", "hitera_l3", "hitera_l4", "hitera_r1",
            "hitera_r2", "hitera_r3", "hitera_r4"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "hitslat_rear"
        };
    };

    class CUP_M1Abrams_Base: Tank_F {
        ace_hunterkiller = 1;
    };
    class CUP_M1Abrams_TUSK_Base: CUP_M1Abrams_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l01", "hitera_l02", "hitera_l03", "hitera_l04", "hitera_l05",
            "hitera_l06", "hitera_l07", "hitera_l08", "hitera_l09", "hitera_l10",
            "hitera_l11", "hitera_l12", "hitera_l13", "hitera_l14", "hitera_l15",
            "hitera_l16", "hitera_r01", "hitera_r02", "hitera_r03", "hitera_r04",
            "hitera_r05", "hitera_r06", "hitera_r07", "hitera_r08", "hitera_r09",
            "hitera_r10", "hitera_r11", "hitera_r12", "hitera_r13", "hitera_r14",
            "hitera_r15", "hitera_r16"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "hitslat_rear"
        };
    };

    class CUP_M1Abrams_A2_Base;
    class CUP_M1Abrams_A2_TUSK_Base: CUP_M1Abrams_A2_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l01", "hitera_l02", "hitera_l03", "hitera_l04", "hitera_l05",
            "hitera_l06", "hitera_l07", "hitera_l08", "hitera_l09", "hitera_l10",
            "hitera_l11", "hitera_l12", "hitera_l13", "hitera_l14", "hitera_l15",
            "hitera_l16", "hitera_l17", "hitera_l18", "hitera_l19", "hitera_l20",
            "hitera_r01", "hitera_r02", "hitera_r03", "hitera_r04", "hitera_r05",
            "hitera_r06", "hitera_r07", "hitera_r08", "hitera_r09", "hitera_r10",
            "hitera_r11", "hitera_r12", "hitera_r13", "hitera_r14", "hitera_r15",
            "hitera_r16", "hitera_r17", "hitera_r18", "hitera_r19", "hitera_r20"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "hitslat_rear"
        };
    };

    class CUP_M1A2Abrams_Base: Tank_F {
        ace_hunterkiller = 1;
    };
    class CUP_M1A2Abrams_TUSK_Base: CUP_M1A2Abrams_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l01", "hitera_l02", "hitera_l03", "hitera_l04", "hitera_l05",
            "hitera_l06", "hitera_l07", "hitera_l08", "hitera_l09", "hitera_l10",
            "hitera_l11", "hitera_l12", "hitera_l13", "hitera_l14", "hitera_l15",
            "hitera_l16", "hitera_r01", "hitera_r02", "hitera_r03", "hitera_r04",
            "hitera_r05", "hitera_r06", "hitera_r07", "hitera_r08", "hitera_r09",
            "hitera_r10", "hitera_r11", "hitera_r12", "hitera_r13", "hitera_r14",
            "hitera_r15", "hitera_r16"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "hitslat_rear"
        };
    };
    class CUP_M1A2Abrams_TUSK_II_Base: CUP_M1A2Abrams_TUSK_Base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "hitera_l01", "hitera_l02", "hitera_l03", "hitera_l04", "hitera_l05",
            "hitera_l06", "hitera_l07", "hitera_l08", "hitera_l09", "hitera_l10",
            "hitera_l11", "hitera_l12", "hitera_l13", "hitera_l14", "hitera_l15",
            "hitera_l16", "hitera_l17", "hitera_l18", "hitera_l19", "hitera_l20",
            "hitera_r01", "hitera_r02", "hitera_r03", "hitera_r04", "hitera_r05",
            "hitera_r06", "hitera_r07", "hitera_r08", "hitera_r09", "hitera_r10",
            "hitera_r11", "hitera_r12", "hitera_r13", "hitera_r14", "hitera_r15",
            "hitera_r16", "hitera_r17", "hitera_r18", "hitera_r19", "hitera_r20"
        };
    };
    class Helicopter_Base_H;
    class CUP_KA50_Base: Helicopter_Base_H {
        class pilotCamera;
    };
    class CUP_KA50_Dynamic_Base: CUP_KA50_Base {
        class pilotCamera: pilotCamera {
            EGVAR(missileguidance,usePilotCameraForTargeting) = 1;
        };
    };
};
