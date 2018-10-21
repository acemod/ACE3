
class CfgVehicles {
    class NATO_Box_Base;
    class Box_NATO_Grenades_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HandFlare_White,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Green,12);
            MACRO_ADDMAGAZINE(ACE_M84,12);
        };
    };

    class EAST_Box_Base;
    class Box_East_Grenades_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HandFlare_Yellow,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Red,12);
            MACRO_ADDMAGAZINE(ACE_M84,12);
        };
    };

    class IND_Box_Base;
    class Box_IND_Grenades_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HandFlare_Yellow,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Green,12);
            MACRO_ADDMAGAZINE(ACE_M84,12);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HandFlare_White,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Red,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Green,12);
            MACRO_ADDMAGAZINE(ACE_HandFlare_Yellow,12);
            MACRO_ADDMAGAZINE(ACE_M84,12);
            MACRO_ADDMAGAZINE(ACE_M14,12);
        };
    };
};
