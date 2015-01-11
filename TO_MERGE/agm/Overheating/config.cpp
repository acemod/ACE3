class CfgPatches {
  class AGM_Overheating {
    units[] = {};
    weapons[] = {"AGM_SpareBarrel"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi", "CAA-Picard"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Overheating {
    class AGM_Overheating {
      file = "\AGM_Overheating\functions";
      class checkTemperature;
      class clearJam;
      class cooldown;
      class jamWeapon;
      class overheat;
      class swapBarrel;
      class swapBarrelCallback;
    };
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class AGM_Overheating_Overheat {
      clientFiredBIS = "if (_this select 0 == AGM_player) then {_this call AGM_Overheating_fnc_overheat};";
    };
  };
};

class Extended_Take_EventHandlers {
  class CAManBase {
    class AGM_Overheating_UnjamReload {
      clientTake = "if (_this select 0 == AGM_player && {(_this select 1) in [uniformContainer (_this select 0), vestContainer (_this select 0), backpackContainer (_this select 0)]} && {_this select 2 == currentMagazine (_this select 0)}) then {_vehicle = vehicle (_this select 0); [_vehicle, currentWeapon _vehicle, true] call AGM_Overheating_fnc_clearJam};";
    };
  };
};

class AGM_Core_Default_Keys {
  class clearJam {
    displayName = "$STR_AGM_Overheating_UnjamWeapon";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon && {currentWeapon _player in (_player getVariable ['AGM_Overheating_jammedWeapons', []])}";
    statement = "[_player, currentMuzzle _player, false] call AGM_Overheating_fnc_clearJam;";
    key = 19;
    shift = 1;
    control = 0;
    alt = 0;
  };
};

class CfgSounds {
  class AGM_BarrelSwap {
    sound[] = {"\AGM_Overheating\sounds\barrelswap.ogg",5,1,200};
    titles[] = {};
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
        class AGM_SwapBarrel {
          displayName = "$STR_AGM_Overheating_SwapBarrel";
          condition = "'AGM_SpareBarrel' in items _player && {getNumber (configFile >> 'CfgWeapons' >> currentWeapon _player >> 'AGM_Overheating_allowSwapBarrel') == 1}";
          statement = "[_player, currentWeapon _player] call AGM_Overheating_fnc_swapBarrel;";
          showDisabled = 0;
          priority = 3;
          icon = "AGM_Overheating\UI\spare_barrel_ca.paa";
          hotkey = "B";
        };
      };
      class AGM_CheckTemperature {
        displayName = "$STR_AGM_Overheating_CheckTemperatureShort";
        condition = "currentWeapon _player in [primaryWeapon _player, secondaryWeapon _player, handgunWeapon _player]";
        statement = "[_player, currentWeapon _player] call AGM_Overheating_fnc_CheckTemperature;";
        showDisabled = 0;
        priority = 3.1;
        icon = "AGM_Overheating\UI\temp_ca.paa";
        hotkey = "P";
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
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class B_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class O_supplyCrate_F: B_supplyCrate_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class I_supplyCrate_F: B_supplyCrate_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class IG_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class C_supplyCrate_F: ReammoBox_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,2)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_SpareBarrel,6)
    };
  };

  // Add AGM_SpareBarrel to every machine gunner.
  #define MACRO_ADDSPAREBARREL \
    items[] = {"FirstAidKit", "AGM_SpareBarrel"}; \
    respawnitems[] = {"FirstAidKit", "AGM_SpareBarrel"};

  // NATO
  class B_Soldier_02_f; class B_soldier_AR_F:B_Soldier_02_f {MACRO_ADDSPAREBARREL};
  class B_Soldier_support_base_F; class B_soldier_AAR_F:B_Soldier_support_base_F {MACRO_ADDSPAREBARREL};
  class B_Soldier_base_F; class B_CTRG_soldier_AR_A_F:B_Soldier_base_F {MACRO_ADDSPAREBARREL};

  // Guerrilla
  class I_G_Soldier_base_F; class I_G_Soldier_AR_F:I_G_Soldier_base_F {MACRO_ADDSPAREBARREL};
  class B_G_Soldier_AR_F:I_G_Soldier_AR_F {MACRO_ADDSPAREBARREL};
  class O_G_Soldier_AR_F:I_G_Soldier_AR_F {MACRO_ADDSPAREBARREL};

  // Iran
  class O_Soldier_base_F; class O_Soldier_AR_F:O_Soldier_base_F {MACRO_ADDSPAREBARREL};
  class O_Soldier_support_base_F; class O_Soldier_AAR_F:O_Soldier_support_base_F {MACRO_ADDSPAREBARREL};
  class O_Soldier_Urban_base; class O_soldierU_AR_F:O_Soldier_Urban_base {MACRO_ADDSPAREBARREL};
  class O_soldierU_AAR_F:O_Soldier_Urban_base {MACRO_ADDSPAREBARREL};

  // Czech
  class I_Soldier_02_F; class I_Soldier_AR_F:I_Soldier_02_F {MACRO_ADDSPAREBARREL};
  class I_Soldier_support_base_F; class I_Soldier_AAR_F:I_Soldier_support_base_F {MACRO_ADDSPAREBARREL};
};

class CfgWeapons {
  class AGM_ItemCore;
  class InventoryItem_Base_F;

  class AGM_SpareBarrel: AGM_ItemCore {
    displayname = "$STR_AGM_Overheating_SpareBarrelName";
    descriptionshort = "$STR_AGM_Overheating_SpareBarrelDescription";
    //model = "";
    picture = "\AGM_Overheating\UI\spare_barrel_ca.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 50;
    };
  };

  class Rifle;
  class Rifle_Base_F : Rifle {
    // Dispersion, SlowdownFactor and JamChance arrays have 4 values for different temperatures, which are interpolated between.
    // These values correspond to temperatures Converted to real life values: 0: 0°C, 1: 333°C, 2: 666°C, 3: 1000°C.

    // Dispersion in radians. First value is for temp. 0, second for temp. 1 and so on. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    // How much the projectile gets slowed down before leaving the barrel. 0.9 means the bullet will lose 10% velocity. Values inbetween get interpolated. Numbers greater 1 increase the velocity, smaller 1 decrease it.
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    // Chance to jam the weapon. 0.0003 means 3 malfunctions on 10,000 rounds fired at this temperature. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
    // When no reliable data exists for temperature vs. jam chance except MRBS, the following uniform criteria was adopted: [0, 1/MRBS, 5/MRBS, 25/MRBS].
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class Rifle_Long_Base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class arifle_MX_Base_F : Rifle_Base_F {
    AGM_clearJamAction = "GestureReloadMX";   // Custom jam clearing action. Default uses reload animation.
    AGM_checkTemperatureAction = "Gear";      // Custom check temperature action. Default uses gear animation.
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class arifle_MX_SW_F : arifle_MX_Base_F {
    AGM_clearJamAction = "";              // Custom jam clearing action. Use empty string to undefine.
    AGM_Overheating_allowSwapBarrel = 1;  // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class arifle_Katiba_Base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class mk20_base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class Tavor_base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class SDAR_base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class EBR_base_F : Rifle_Long_Base_F {
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class DMR_01_base_F : Rifle_Long_Base_F {
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class GM6_base_F : Rifle_Long_Base_F {
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class LRR_base_F : Rifle_Long_Base_F {
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class LMG_Mk200_F : Rifle_Long_Base_F {
    AGM_Overheating_allowSwapBarrel = 1;
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class LMG_Zafir_F : Rifle_Long_Base_F {
    AGM_Overheating_allowSwapBarrel = 1;
    AGM_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class SMG_01_Base : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class SMG_02_base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };

  class pdw2000_base_F : Rifle_Base_F {
    AGM_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
    AGM_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
    AGM_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
  };
};

class CfgAmmo {
  class BulletCore;
  class BulletBase : BulletCore {
    AGM_BulletMass = 0;       // Bullet mass in grams
  };

  // Rifle and MG rounds
  class B_556x45_Ball : BulletBase {
    AGM_BulletMass = 4.1;     // 5.56x45 NATO
  };

  class B_65x39_Caseless : BulletBase {
    AGM_BulletMass = 8;       // 6.5mm Grendel
  };

  class B_762x51_Ball : BulletBase {
    AGM_BulletMass = 10;      // 7.62x51 NATO
  };
  class AGM_B_762x51_M118LR : B_762x51_Ball {
    AGM_BulletMass = 11;      // 7.62x51 NATO M118
  };

  class B_127x99_Ball : BulletBase {
    AGM_BulletMass = 42;      // 12.7×99mm NATO (.50 BMG)
  };

  class B_127x108_Ball : BulletBase {
    AGM_BulletMass = 48.3;    // 12.7x108
  };

  class B_408_Ball : BulletBase {
    AGM_BulletMass = 27;      // .408 Cheyenne Tactical
  };

  // Pistol Rounds
  class B_9x21_Ball : BulletBase {
    AGM_BulletMass = 7.45;    // 9×21mm IMI
  };
  class B_9x19_Ball : B_9x21_Ball {
    AGM_BulletMass = 7.45;    // 9×19mm Parabellum
  };
  class B_127x33_Ball : BulletBase {
    AGM_BulletMass = 21;      // .50 AE
  };
  class B_45ACP_Ball : BulletBase {
    AGM_BulletMass = 12;      // .45 ACP
  };
};
