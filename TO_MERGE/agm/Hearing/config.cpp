class CfgPatches {
  class AGM_Hearing {
    units[] = {};
    weapons[] = {"AGM_EarBuds"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "CAA-Picard", "HopeJ", "commy2"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class CfgFunctions {
  class AGM_Hearing {
    class AGM_Hearing {
      file = "AGM_Hearing\functions";
      class addEarPlugs;
      class earRinging;
      class explosionNear;
      class firedNear;
      class hasEarPlugsIn;
      class putInEarPlugs;
      class removeEarPlugs;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Hearing {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Hearing\clientInit.sqf'";
  };
};

class Extended_Init_EventHandlers {
  class CAManBase {
    class AGM_Hearing_AddEarPlugs {
      init = "if (local (_this select 0)) then {_this call AGM_Hearing_fnc_addEarPlugs};";
    };
  };
};

class Extended_FiredNear_EventHandlers {
  class CAManBase {
    class AGM_Hearing_FiredNear {
      clientFiredNear = "if (_this select 0 == AGM_player) then {_this call AGM_Hearing_fnc_firedNear};";
    };
  };
};

class Extended_Explosion_EventHandlers {
  class CAManBase {
    class AGM_Hearing_ExplosionNear {
      clientExplosion = "if (_this select 0 == AGM_player) then {_this call AGM_Hearing_fnc_explosionNear};";
    };
  };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_Equipment {
        class AGM_PutInEarplugs {
          displayName = "$STR_AGM_Hearing_Earbuds_On";
          condition = "!([_player] call AGM_Hearing_fnc_hasEarPlugsIn) && {'AGM_EarBuds' in items _player}";
          statement = "[_player] call AGM_Hearing_fnc_putInEarPlugs";
          showDisabled = 0;
          priority = 2.5;
          icon = "AGM_Hearing\UI\agm_earplugs_x_ca.paa";
          hotkey = "E";
          enableInside = 1;
        };
        class AGM_RemoveEarplugs {
          displayName = "$STR_AGM_Hearing_Earbuds_Off";
          condition = "[_player] call AGM_Hearing_fnc_hasEarPlugsIn";
          statement = "[_player] call AGM_Hearing_fnc_removeEarPlugs";
          showDisabled = 0;
          priority = 2.5;
          icon = "AGM_Hearing\UI\agm_earplugs_x_ca.paa";
          hotkey = "E";
          enableInside = 1;
        };
      };
    };
  };

  class ReammoBox_F;
  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class FIA_Box_Base_F;

  class Box_NATO_Support_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class B_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class O_supplyCrate_F: B_supplyCrate_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class I_supplyCrate_F: B_supplyCrate_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class IG_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class C_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_EarBuds,12)
    };
  };
};

class CfgSounds {
  class AGM_EarRinging_Weak {
    sound[] = {"\AGM_Hearing\sounds\agm_earringing_weak.wav",8,1.7};
    titles[] = {};
  };
  class AGM_EarRinging_Medium {
    sound[] = {"\AGM_Hearing\sounds\agm_earringing_medium.wav",8,1.7};
    titles[] = {};
  };
  class AGM_EarRinging_Heavy {
    sound[] = {"\AGM_Hearing\sounds\agm_earringing_heavy.wav",8,1.7};
    titles[] = {};
  };
};

class CfgWeapons {
  class AGM_ItemCore;
  class InventoryItem_Base_F;

  class AGM_EarBuds: AGM_ItemCore {
    displayName = "$STR_AGM_Hearing_Earbuds_Name";
    descriptionShort = "$STR_AGM_Hearing_Earbuds_Description";
    model = "\AGM_Hearing\agm_earplugs.p3d";
    picture = "\AGM_Hearing\UI\agm_earplugs_x_ca.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };
};

// Setting up old stuff for A3
class CfgAmmo {
  class BulletBase;
  class B_127x108_Ball: BulletBase {
    audibleFire = 15;
  };
};
