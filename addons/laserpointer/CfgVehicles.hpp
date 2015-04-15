class CfgVehicles {
    class NATO_Box_Base;
    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,4);
        };
    };

    class EAST_Box_Base;
    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,4);
        };
    };

    class IND_Box_Base;
    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,4);
        };
    };

    class FIA_Box_Base_F;
    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,4);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,4);
        };
    };
};
