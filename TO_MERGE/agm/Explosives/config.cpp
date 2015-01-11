class CfgPatches {
  class AGM_Explosives {
    units[] = {};
    weapons[] = {"AGM_Clacker", "AGM_DefusalKit", "AGM_M26_Clacker", "AGM_DeadManSwitch"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"Garth 'L-H' de Wet"};
    authorUrl = "https://github.com/corruptedheart/";
  };
};

class CfgFunctions {
  class AGM_Explosives {
    class Explosives {
      file="AGM_Explosives\functions";

      class AddClacker;
      class CanDefuse;
      class DefuseExplosive;
      class DetonateExplosive;
      class HandleScrollWheel;

      class hasExplosives;
      class hasPlacedExplosives;

      class getDetonators;
      class getPlacedExplosives;

      class initialise{postInit=1;};
      //class JammerInit;

      class openDetonateUI;
      class openPlaceUI;
      class openTransmitterUI;
      class openTimerSetUI;
      class openTriggerSelectionUI;

      class Place_Approve;
      class Place_Cancel;
      class PlaceExplosive;

      class SelectTrigger;
      class SetupExplosive;
      class SetPos;
      class StartDefuse;
      class StartTimer;

      class TriggerType;
    };
  };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

#define MACRO_DETONATEACTION    class AGM_SelfActions { \
      class AGM_Explosives { \
        displayName = $STR_AGM_Explosives_Menu;\
        condition = "true";\
        statement = "";\
        exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
        showDisabled = 1;\
        priority = 4;\
        icon = "AGM_Explosives\UI\Icon_Explosive_ca.paa"; \
        subMenu[] = {"AGM_Explosives", 1};\
        hotkey = "X";\
        class AGM_Detonate {\
          displayName = $STR_AGM_Explosives_Detonate;\
          condition = "[_player] call AGM_Explosives_fnc_hasPlacedExplosives and {count ([_player] call AGM_Explosives_fnc_getDetonators) > 0}";\
          statement = "[_player] call AGM_Explosives_fnc_openTransmitterUI;";\
          exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
          icon = "AGM_Explosives\UI\Icon_Explosive_ca.paa"; \
          showDisabled = 1;\
          priority = 2;\
          hotkey = "T";\
        };\
      };\
    };

class CfgVehicles {
  class Man;

  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_Explosives {
        displayName = $STR_AGM_Explosives_Menu;
        condition = "!(_player getVariable ['AGM_PlantingExplosive', false])";
        statement = "";
        exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
        showDisabled = 1;
        priority = 4;
        icon = "AGM_Explosives\UI\Icon_Explosive_ca.paa";
        subMenu[] = {"AGM_Explosives", 1};
        hotkey = "X";
        //Sub-menu items
        class AGM_Detonate {
          displayName = $STR_AGM_Explosives_Detonate;
          condition = "[_player] call AGM_Explosives_fnc_hasPlacedExplosives and {count ([_player] call AGM_Explosives_fnc_getDetonators) > 0}";
          statement = "[_player] call AGM_Explosives_fnc_openTransmitterUI;";
          exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
          showDisabled = 1;
          icon = "AGM_Explosives\UI\Icon_Explosive_ca.paa";
          priority = 2;
          hotkey = "T";
        };
        class AGM_Place {
          displayName = $STR_AGM_Explosives_Place;
          condition = "(vehicle _player == _player) and {[_player] call AGM_Explosives_fnc_hasExplosives}";
          statement = "[_player] call AGM_Explosives_fnc_openPlaceUI;";
          exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
          showDisabled = 1;
          icon = "AGM_Explosives\UI\Place_Explosive_ca.paa";
          priority = 1;
          hotkey = "P";
        };
        class AGM_Defuse {
          displayName = $STR_AGM_Explosives_Defuse;
          condition = "[_player] call AGM_Explosives_fnc_CanDefuse";
          statement = "[_player, AGM_Interaction_Target] call AGM_Explosives_fnc_StartDefuse;";
          exceptions[] = {"AGM_Interaction_isNotSwimming"}; \
          showDisabled = 0;
          icon = "AGM_Explosives\UI\defuse_ca.paa";
          priority = 0.8;
          hotkey = "F";
        };
      };
    };
  };

  #include "CfgVehicles.hpp"

  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class FIA_Box_Base_F;
  class Box_NATO_Support_F;

  class Box_NATO_AmmoOrd_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_Clacker,12)
      MACRO_ADDITEM(AGM_M26_Clacker,6)
      MACRO_ADDITEM(AGM_DefusalKit,12)
    };
  };

  class Box_East_AmmoOrd_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_Clacker,12)
      MACRO_ADDITEM(AGM_M26_Clacker,6)
      MACRO_ADDITEM(AGM_DefusalKit,12)
    };
  };

  class Box_IND_AmmoOrd_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_Clacker,12)
      MACRO_ADDITEM(AGM_M26_Clacker,6)
      MACRO_ADDITEM(AGM_DefusalKit,12)
      MACRO_ADDITEM(AGM_Deadmanswitch,2)
    };
  };

  class Box_FIA_Ammo_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_Clacker,2)
      MACRO_ADDITEM(AGM_M26_Clacker,2)
      MACRO_ADDITEM(AGM_DefusalKit,2)
      MACRO_ADDITEM(AGM_Deadmanswitch,1)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_Clacker,12)
      MACRO_ADDITEM(AGM_M26_Clacker,6)
      MACRO_ADDITEM(AGM_DefusalKit,12)
      MACRO_ADDITEM(AGM_Deadmanswitch,6)
    };
  };

  class B_Kitbag_rgr;
  class B_Kitbag_rgr_Exp: B_Kitbag_rgr {
    class TransportItems {
      class _xx_ToolKit { // xXToOlKiT420mLgXx
        count = 0;
      };
    };
  };
  class B_Carryall_ocamo;
  class B_Carryall_ocamo_Exp: B_Carryall_ocamo {
    class TransportItems {
      class _xx_ToolKit {
        count = 0;
      };
    };
  };
  class B_Carryall_oucamo;
  class B_Carryall_oucamo_Exp: B_Carryall_oucamo {
    class TransportItems {
      class _xx_ToolKit {
        count = 0;
      };
    };
  };
  class B_Carryall_oli;
  class G_Carryall_Exp: B_Carryall_oli {
    class TransportItems {
      class _xx_ToolKit {
        count = 0;
      };
    };
  };
  class I_Carryall_oli_Exp: B_Carryall_oli {
    class TransportItems {
      class _xx_ToolKit {
        count = 0;
      };
    };
  };

  #include "Module.hpp"

  // Add AGM_Clacker and AGM_DefusalKit to every explosive unit.
  #define MACRO_ADDMINEKIT \
    items[] = {"FirstAidKit", "AGM_Clacker", "AGM_DefusalKit"}; \
    respawnitems[] = {"FirstAidKit", "AGM_Clacker", "AGM_DefusalKit"};

  class B_Soldier_base_F; class B_soldier_exp_F:B_Soldier_base_F {MACRO_ADDMINEKIT};
  class B_Soldier_03_f; class B_engineer_F:B_Soldier_03_f {MACRO_ADDMINEKIT};
  class B_Soldier_diver_base_F; class B_diver_exp_F:B_Soldier_diver_base_F {MACRO_ADDMINEKIT};
  class B_Soldier_recon_base; class B_recon_exp_F:B_Soldier_recon_base {MACRO_ADDMINEKIT};
  class B_CTRG_soldier_engineer_exp_F:B_Soldier_base_F {MACRO_ADDMINEKIT};
  class I_G_Soldier_base_F; class I_G_engineer_F:I_G_Soldier_base_F {MACRO_ADDMINEKIT};
  class I_G_Soldier_exp_F:I_G_Soldier_base_F {MACRO_ADDMINEKIT};
  class B_G_engineer_F:I_G_engineer_F {MACRO_ADDMINEKIT};
  class O_G_engineer_F:I_G_engineer_F {MACRO_ADDMINEKIT};
  class B_G_Soldier_exp_F:I_G_Soldier_exp_F {MACRO_ADDMINEKIT};
  class O_G_Soldier_exp_F:I_G_Soldier_exp_F {MACRO_ADDMINEKIT};
  class I_Soldier_02_F; class I_Soldier_exp_F:I_Soldier_02_F {MACRO_ADDMINEKIT};
  class I_Soldier_base_F; class I_engineer_F:I_Soldier_base_F {MACRO_ADDMINEKIT};
  class I_Soldier_diver_base_F; class I_diver_exp_F:I_Soldier_diver_base_F {MACRO_ADDMINEKIT};
  class O_Soldier_base_F; class O_soldier_exp_F:O_Soldier_base_F {MACRO_ADDMINEKIT};
  class O_engineer_F:O_Soldier_base_F {MACRO_ADDMINEKIT};
  class O_Soldier_diver_base_F; class O_diver_exp_F:O_Soldier_diver_base_F {MACRO_ADDMINEKIT};
  class O_Soldier_recon_base; class O_recon_exp_F:O_Soldier_recon_base {MACRO_ADDMINEKIT};
  class O_Soldier_Urban_base; class O_soldierU_exp_F:O_Soldier_Urban_base {MACRO_ADDMINEKIT};
  class O_engineer_U_F:O_Soldier_Urban_base {MACRO_ADDMINEKIT};
  class B_Protagonist_VR_F:B_Soldier_base_F {MACRO_ADDMINEKIT};
  class O_Protagonist_VR_F:O_Soldier_base_F {MACRO_ADDMINEKIT};
  class I_Protagonist_VR_F:I_Soldier_base_F {MACRO_ADDMINEKIT};
  class B_Soldier_F; class b_soldier_universal_f:B_Soldier_F {MACRO_ADDMINEKIT};
  class B_G_Soldier_F; class b_g_soldier_universal_f:B_G_Soldier_F {MACRO_ADDMINEKIT};
  class O_Soldier_F; class o_soldier_universal_f:O_Soldier_F {MACRO_ADDMINEKIT};
  class O_G_Soldier_F; class o_g_soldier_universal_f:O_G_Soldier_F {MACRO_ADDMINEKIT};
  class I_soldier_F; class i_soldier_universal_f:I_soldier_F {MACRO_ADDMINEKIT};
  class I_G_Soldier_F; class i_g_soldier_universal_f:I_G_Soldier_F {MACRO_ADDMINEKIT};

  // Add AGM_Clacker to snipers and spotters for setting off Claymores
  #define MACRO_ADDCLAYMOREKIT \
    items[] = {"FirstAidKit","AGM_Clacker"}; \
    respawnitems[] = {"FirstAidKit","AGM_Clacker"};

  class B_Soldier_sniper_base_F;
  class B_sniper_F: B_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
  class B_spotter_F: B_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
  class I_Soldier_sniper_base_F;
  class I_Sniper_F: I_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
  class I_Spotter_F: I_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
  class O_Soldier_sniper_base_F;
  class O_sniper_F: O_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
  class O_spotter_F: O_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};

};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"

#include "ExplosivesUI.hpp"

class CfgActions {
  class None;
  class Deactivate:None {
    show = 0;
  };
  class DeactivateMine:None {
    show = 0;
  };
};

class AGM_Parameters_Boolean {
  // Boolean Parameters (0/1)
  AGM_Explosives_RequireSpecialist = 0;
  AGM_Explosives_PunishNonSpecialists = 1;
};
