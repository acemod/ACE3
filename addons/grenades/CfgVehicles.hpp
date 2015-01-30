#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
  };

class CfgVehicles {
  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class Box_NATO_Support_F;

  class Box_NATO_Grenades_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_HandFlare_White,12)
      MACRO_ADDITEM(ACE_HandFlare_Green,12)
      MACRO_ADDITEM(ACE_M84,12)
    };
  };

  class Box_East_Grenades_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_HandFlare_Yellow,12)
      MACRO_ADDITEM(ACE_HandFlare_Red,12)
      MACRO_ADDITEM(ACE_M84,12)
    };
  };

  class Box_IND_Grenades_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_HandFlare_Yellow,12)
      MACRO_ADDITEM(ACE_HandFlare_Green,12)
      MACRO_ADDITEM(ACE_M84,12)
    };
  };

  class ACE_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(ACE_HandFlare_White,12)
      MACRO_ADDITEM(ACE_HandFlare_Red,12)
      MACRO_ADDITEM(ACE_HandFlare_Green,12)
      MACRO_ADDITEM(ACE_HandFlare_Yellow,12)
      MACRO_ADDITEM(ACE_M84,12)
    };
  };
};
