
class CfgVehicles {
    class NATO_Box_Base;
    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_muzzle_mzls_H,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_B,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_01,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_02,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_338,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_93mmg,5);
        };
    };

    class EAST_Box_Base;
    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_muzzle_mzls_H,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_B,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_01,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_02,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_338,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_93mmg,5);
        };
    };

    class IND_Box_Base;
    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_muzzle_mzls_H,1);
            MACRO_ADDITEM(ACE_muzzle_mzls_B,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_L,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_01,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_02,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_338,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_93mmg,5);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_muzzle_mzls_H,2);
            MACRO_ADDITEM(ACE_muzzle_mzls_B,2);
            MACRO_ADDITEM(ACE_muzzle_mzls_L,2);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_01,2);
            MACRO_ADDITEM(ACE_muzzle_mzls_smg_02,2);
            MACRO_ADDITEM(ACE_muzzle_mzls_338,5);
            MACRO_ADDITEM(ACE_muzzle_mzls_93mmg,5);
        };
    };
};
