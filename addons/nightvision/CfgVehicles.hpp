class CfgVehicles {
    class All {
        ACE_NightVision_grain = 0.75;
        ACE_NightVision_blur = 0.055;
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_NVG_Gen1,6);
            MACRO_ADDITEM(ACE_NVG_Gen2,6);
            //MACRO_ADDITEM(ACE_NVG_Gen3,6);
            MACRO_ADDITEM(ACE_NVG_Gen4,6);
            MACRO_ADDITEM(ACE_NVG_Wide,6);
        };
    };
};
