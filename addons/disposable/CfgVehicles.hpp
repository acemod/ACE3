class CfgVehicles {
    #define MACRO_NONLAW \
        class TransportMagazines { \
            class _xx_NLAW_F { \
                count = 0; \
            }; \
        };

    class ReammoBox_F;
    class NATO_Box_Base: ReammoBox_F {};
    class Box_NATO_Ammo_F: NATO_Box_Base {
        MACRO_NONLAW
    };
    class Box_NATO_WpsLaunch_F: NATO_Box_Base {
        MACRO_NONLAW
    };

    class IND_Box_Base: ReammoBox_F {};
    class Box_IND_WpsLaunch_F: IND_Box_Base {
        MACRO_NONLAW
    };
    class Box_IND_Ammo_F: IND_Box_Base {
        MACRO_NONLAW
    };

    class B_supplyCrate_F: ReammoBox_F {
        MACRO_NONLAW
    };
    class I_supplyCrate_F: B_supplyCrate_F {
        MACRO_NONLAW
    };
    class C_supplyCrate_F: ReammoBox_F {
        MACRO_NONLAW
    };

    class B_AssaultPack_rgr;
    class B_AssaultPack_rgr_LAT: B_AssaultPack_rgr {
        MACRO_NONLAW
    };
    class B_AssaultPack_rgr_ReconLAT: B_AssaultPack_rgr {
        MACRO_NONLAW
    };

    class B_Carryall_mcamo;
    class B_AssaultPack_mcamo_Ammo: B_Carryall_mcamo {
        MACRO_NONLAW
    };
    class B_Carryall_oli;
    class I_Fieldpack_oli_Ammo: B_Carryall_oli {
        MACRO_NONLAW
    };

    class B_AssaultPack_dgtl;
    class I_Fieldpack_oli_LAT: B_AssaultPack_dgtl {
        MACRO_NONLAW
    };

    class CargoNet_01_ammo_base_F;
    class B_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
        MACRO_NONLAW
    };
    class I_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
        MACRO_NONLAW
    };

    class Slingload_01_Base_F;
    class B_Slingload_01_Cargo_F: Slingload_01_Base_F {
        MACRO_NONLAW
    };

    class Tank_F;
    class APC_Tracked_01_base_F: Tank_F {
        MACRO_NONLAW
    };
    /*class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {
        MACRO_NONLAW
    };
    class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
        MACRO_NONLAW
    };
    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        MACRO_NONLAW
    };
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        MACRO_NONLAW
    };*/

    class Car_F;
    class MRAP_01_base_F: Car_F {
        MACRO_NONLAW
    };
    /*class MRAP_01_gmg_base_F: MRAP_01_base_F {
        MACRO_NONLAW
    };
    class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {
        MACRO_NONLAW
    };
    class B_MRAP_01_F: MRAP_01_base_F {
        MACRO_NONLAW
    };
    class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
        MACRO_NONLAW
    };
    class B_MRAP_01_hmg_F: MRAP_01_hmg_base_F {
        MACRO_NONLAW
    };*/

    class MRAP_03_base_F: Car_F {
        MACRO_NONLAW
    };
    /*class MRAP_03_hmg_base_F: MRAP_03_base_F {
        MACRO_NONLAW
    };
    class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
        MACRO_NONLAW
    };
    class I_MRAP_03_F: MRAP_03_base_F {
        MACRO_NONLAW
    };
    class I_MRAP_03_hmg_F: MRAP_03_hmg_base_F {
        MACRO_NONLAW
    };
    class I_MRAP_03_gmg_F: MRAP_03_gmg_base_F {
        MACRO_NONLAW
    };*/

    class Wheeled_APC_F: Car_F {};
    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        MACRO_NONLAW
    };
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        MACRO_NONLAW
    };
    /*class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {
        MACRO_NONLAW
    };
    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        MACRO_NONLAW
    };
    class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {
        MACRO_NONLAW
    };
    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        MACRO_NONLAW
    };*/
};
