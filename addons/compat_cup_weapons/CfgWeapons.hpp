class CfgWeapons {
    class Launcher_Base_F;
    class CUP_launch_M47: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_range = 8;
        ace_overpressure_damage = 0.5;
    };

    class CUP_launch_MAAWS: Launcher_Base_F {
        ace_overpressure_angle = 60;
        ace_overpressure_range = 15;
        ace_overpressure_damage = 0.7;
    };
    class CUP_launch_MAAWS_Scope: CUP_launch_MAAWS {};

    class CUP_launch_RPG7V: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_range = 6;
        ace_overpressure_damage = 0.5;
    };

    class CUP_launch_Mk153Mod0: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_range = 15;
        ace_overpressure_damage = 0.7;
    };
    class CUP_launch_Mk153Mod0_SMAWOptics: CUP_launch_Mk153Mod0 {};

    class CUP_launch_NLAW_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_range = 2;
        ace_overpressure_damage = 0.5;
        ace_nlaw_enabled = 1;
        canLock = 1;
    };

    // Vehicle weapons are still from @CUP Weapons
    class rockets_230mm_GAT;
    class CUP_Vmlauncher_GRAD_veh: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 2.8;
    };
    class CUP_Vmlauncher_MLRS_veh: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 1.9;
    };
    class mortar_155mm_AMOS;
    class CUP_Vcannon_D30_veh: mortar_155mm_AMOS {
        EGVAR(overpressure,offset) = 2;
    };
    class CUP_Vcannon_M119_veh: CUP_Vcannon_D30_veh {
        EGVAR(overpressure,offset) = 3;
    };
    class cannon_120mm;
    class CUP_Vcannon_D30AT_veh: cannon_120mm {
        EGVAR(overpressure,offset) = 2;
    };
    class weapon_ShipCannon_120mm;
    class CUP_Vmortar_M121: weapon_ShipCannon_120mm {
        EGVAR(overpressure,offset) = 0.6;
    };
};
