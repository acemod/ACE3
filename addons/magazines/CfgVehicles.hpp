
#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
  magazine = #MAGAZINE; \
  count = COUNT; \
}

class CfgVehicles {
    class NATO_Box_Base;
    class Box_NATO_Wps_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_AP,2);
        };
    };

    class Box_NATO_WpsSpecial_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_Tracer_Dim,1);
        };
    };

    class Box_NATO_Ammo_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_SD,2);
        };
    };

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_SD,6);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,3);
        };
    };

    class ReammoBox_F;
    class B_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_SD,2);
        };
    };

    class EAST_Box_Base;
    class Box_East_Wps_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_AP,2);
        };
    };

    class Box_East_WpsSpecial_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_Tracer_Dim,1);
        };
    };

    class Box_East_Ammo_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_SD,2);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_SD,6);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,3);
        };
    };

    class O_supplyCrate_F: B_supplyCrate_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_SD,2);
        };
    };

    class IND_Box_Base;
    class Box_IND_Wps_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
        };
    };

    class Box_IND_WpsSpecial_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_Tracer_Dim,2);
        };
    };

    class Box_IND_Ammo_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,2);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,6);
        };
    };

    class FIA_Box_Base_F;
    class Box_FIA_Wps_F: FIA_Box_Base_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
        };
    };

    class Box_FIA_Ammo_F: FIA_Box_Base_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,2);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,6);
        };
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,2);
        };
    };

    class IG_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,2);
        };
    };

    class C_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_SD,2);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_SD,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_SD,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_65x39_caseless_green_mag_AP,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_SD,2);
            MACRO_ADDMAGAZINE(ACE_30Rnd_556x45_Stanag_AP,2);
            /*MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_Tracer,2);
            MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_Tracer_Dim,2);
            MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_SD,2);
            MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_AP,2);*/
        };
    };
};
