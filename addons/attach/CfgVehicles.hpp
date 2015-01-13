#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_SelfActions {
      class ACE_Equipment {
        class GVAR(Attach) {
          displayName = "$STR_ACE_Attach_AttachDetach";
          condition = QUOTE( [_player, ''] call FUNC(canAttach) );
          statement = QUOTE( [_player] call FUNC(openAttachUI); );
          exceptions[] = {"ACE_Drag_isNotDragging"};
          showDisabled = 0;
          priority = 5;
          icon = PATHTOF(UI\attach_ca.paa);
          hotkey = "T";
        };
        class GVAR(Detach) {
          displayName = "$STR_ACE_Attach_Detach";
          condition = QUOTE( [_player] call FUNC(canDetach) );
          statement = QUOTE( [_player] call FUNC(detach) );
          exceptions[] = {"ACE_Drag_isNotDragging"};
          showDisabled = 0;
          priority = 5;
          icon = PATHTOF(UI\detach_ca.paa);
          hotkey = "T";
        };
      };
    };
  };

  class All;
  class ACE_IR_Strobe_Effect: All {
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
      MACRO_ADDITEM(ACE_IR_Strobe_Item,12)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_IR_Strobe_Item,12)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_IR_Strobe_Item,12)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(ACE_IR_Strobe_Item,12)
    };
  };

  class ACE_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(ACE_IR_Strobe_Item,12)
    };
  };
};