#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"AGM_IR_Strobe_Item"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "eRazeri", "CAA-Picard"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

#include "CfgEventHandlers.hpp"

/*
class CfgFunctions {
  class ADDON {
    class ADDON {
      file = PATHTOF(functions);
      class attach;
      class canAttach;
      class canDetach;
      class detach;
      class openAttachUI;
    };
  };
};
*/

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_Equipment {
        class GVAR(Attach) {
          displayName = "$STR_AGM_Attach_AttachDetach";
          condition = QUOTE( [_player, ''] call FUNC(canAttach) );
          statement = QUOTE( [_player] call FUNC(openAttachUI); );
          exceptions[] = {"AGM_Drag_isNotDragging"};
          showDisabled = 0;
          priority = 5;
          icon = PATHTOF(UI\attach_ca.paa);
          hotkey = "T";
        };
        class GVAR(Detach) {
          displayName = "$STR_AGM_Attach_Detach";
          condition = QUOTE( [_player] call FUNC(canDetach) );
          statement = QUOTE( [_player] call FUNC(detach) );
          exceptions[] = {"AGM_Drag_isNotDragging"};
          showDisabled = 0;
          priority = 5;
          icon = PATHTOF(UI\detach_ca.paa);
          hotkey = "T";
        };
      };
    };
  };

  class All;
  class AGM_IR_Strobe_Effect: All {
    scope = 1;
    displayName = "IR Strobe";
    model = "\A3\Weapons_F\empty.p3d";
    simulation = "nvmarker";

    class NVGMarker {
      diffuse[] = {0,0,0};
      ambient[] = {0,0,0};
      brightness = 0.004;
      name = "pozicni blik";
      drawLight = 1;
      drawLightSize = 0.005;
      drawLightCenterSize = 0.003;
      activeLight = 0;
      blinking=1;
      dayLight = 0;
      onlyInNvg = 1;
      useFlare = 0;
    };
    side = 7;//-1=NO_SIDE yellow box,3=CIV grey box,4=NEUTRAL yellow box,6=FRIENDLY green box,7=LOGIC no radar signature
    accuracy = 1000;
    cost = 0;
    armor = 500;
    threat[] = {0,0,0};
    nameSound = "";
    type = 0;
    weapons[] = {};
    magazines[] = {};
    nvTarget = 1;
    destrType = "DestructNo";
    brightness = 20;
  };

  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class FIA_Box_Base_F;

  class Box_NATO_Support_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_IR_Strobe_Item,12)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_IR_Strobe_Item,12)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_IR_Strobe_Item,12)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_IR_Strobe_Item,12)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_IR_Strobe_Item,12)
    };
  };
};

class CfgWeapons {
  class AGM_ItemCore;
  class InventoryItem_Base_F;

  class AGM_IR_Strobe_Item: AGM_ItemCore {
    displayName = "$STR_AGM_IrStrobe_Name";
    descriptionShort = "$STR_AGM_IrStrobe_Description";
    model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = PATHTOF(UI\irstrobe_item.paa);
    scope = 2;
    AGM_attachable = 1;
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };
};

class CfgMagazines {
  class CA_Magazine;
  class B_IR_Grenade: CA_Magazine {
    AGM_Attachable = 1;
  };
  class SmokeShell;
  class Chemlight_green: SmokeShell {
    AGM_Attachable = 1;
  };
};
