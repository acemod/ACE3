class CfgVehicles {
    class Tank_F;
    class MBT_01_base_F: Tank_F {
        ADDON = 1; // same as ADDON[] = {{{0}, 1}, {{0,0}, 3}};
    };
    class MBT_01_arty_base_F: MBT_01_base_F {
        ADDON = 0;
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        ADDON = 0;
    };
    class MBT_02_base_F: Tank_F {
        ADDON = 1;
    };
    class MBT_02_arty_base_F: MBT_02_base_F {
        ADDON = 0;
    };
    class MBT_03_base_F: Tank_F {
        ADDON = 1;
    };
    class MBT_04_base_F: Tank_F {
        ADDON = 1;
    };
    class Wheeled_APC_F;
    class AFV_Wheeled_01_base_F: Wheeled_APC_F {
        ADDON = 1;
    };
};
