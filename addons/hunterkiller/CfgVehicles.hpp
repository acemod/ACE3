class CfgVehicles {
    class Tank_F;
    class MBT_01_base_F: Tank_F { // Merkel Tank
        GVAR(enabled) = 1;
    };
    class MBT_01_arty_base_F: MBT_01_base_F {
        GVAR(enabled) = 0;
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        GVAR(enabled) = 0;
    };

    class Wheeled_APC_F;
    class APC_Wheeled_01_base_F: Wheeled_APC_F { // Badger IFV
        GVAR(enabled) = 1;
    };
};
