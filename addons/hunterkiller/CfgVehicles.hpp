class CfgVehicles {
    class Tank_F;
    class MBT_01_base_F: Tank_F { // Merkel Tank
        ADDON[] = {{{0}, 1}, {{0,0}, 3}};
    };
    class MBT_01_arty_base_F: MBT_01_base_F {
        ADDON = 0;
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        ADDON = 0;
    };

    class Wheeled_APC_F;
    class APC_Wheeled_01_base_F: Wheeled_APC_F { // Badger IFV
        ADDON = 1;
    };

    class MRAP_03_base_F;
    class MRAP_03_hmg_base_F: MRAP_03_base_F {
        ADDON[] = {{{0}, 0}, {{1}, 2}};
    };
};
