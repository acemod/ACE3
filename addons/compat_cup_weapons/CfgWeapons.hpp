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
};
