
class CfgPatches {
  class AGM_Disposable {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Disposable {
    class AGM_Disposable {
      file = "\AGM_Disposable\functions";
      class replaceATWeapon;
      class takeLoadedATWeapon;
      class updateInventoryDisplay;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Disposable {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Disposable\clientInit.sqf'";
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class AGM_Disposable_ReplaceFiredATWeapon {
      firedBIS = "if (local (_this select 0)) then {_this call AGM_Disposable_fnc_replaceATWeapon};";
    };
  };
};

// handle preloaded missile
class Extended_Init_EventHandlers {
  class CAManBase {
    class AGM_Disposable_UpdateInventoryDisplay {
      init = "if (local (_this select 0)) then {_this spawn {[_this select 0, secondaryWeapon (_this select 0)] call AGM_Disposable_fnc_takeLoadedATWeapon}};";
    };
  };
};

class Extended_Take_EventHandlers {
  class CAManBase {
    class AGM_Disposable_UpdateInventoryDisplay {
      take = "if (local (_this select 0)) then {[_this select 0, _this select 2] call AGM_Disposable_fnc_takeLoadedATWeapon; [_this select 0, findDisplay 602] call AGM_Disposable_fnc_updateInventoryDisplay};";
    };
  };
};

class Extended_Put_EventHandlers {
  class CAManBase {
    class AGM_Disposable_UpdateInventoryDisplay {
      put = "if (local (_this select 0)) then {[_this select 0, findDisplay 602] call AGM_Disposable_fnc_updateInventoryDisplay};";
    };
  };
};

class CfgWeapons {
  class Launcher_Base_F;
  class launch_NLAW_F: Launcher_Base_F {
    AGM_UsedTube = "AGM_launch_NLAW_Used_F";      // The class name of the used tube.
    magazines[] = {"AGM_PreloadedMissileDummy"};  // The dummy magazine
  };
  class AGM_launch_NLAW_Used_F: launch_NLAW_F {   // the used tube should be a sub class of the disposable launcher
    scope = 1;
    AGM_isUsedLauncher = 1;
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "$STR_AGM_Disposable_UsedTube";
    descriptionShort = "$STR_AGM_Disposable_UsedTubeDescription";
    magazines[] = {"AGM_FiredMissileDummy"};  // This will disable the used launcher class from being fired again.
    //picture = "";              @todo
    //model = "";                @todo
    weaponPoolAvailable = 0;
  };
};

class CfgMagazines {
  class NLAW_F;
  class AGM_PreloadedMissileDummy: NLAW_F {              // The dummy magazine
    author = "$STR_AGM_Core_AGMTeam";
    scope = 1;
    displayName = "$STR_AGM_Disposable_PreloadedMissileDummy";
    picture = "\AGM_Core\UI\blank_CO.paa";
    weaponPoolAvailable = 0;
    mass = 0;
  };
  class AGM_FiredMissileDummy: AGM_PreloadedMissileDummy {
    count = 0;
  };
  class AGM_UsedTube_F: NLAW_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "$STR_AGM_Disposable_UsedTube";
    descriptionShort = "$STR_AGM_Disposable_UsedTubeDescription";
    displayNameShort = "-";
    count = 0;
    weaponPoolAvailable = 0;
    modelSpecial = "";
    mass = 0;
  };
};

class CfgVehicles {
  #define MACRO_NONLAW \
    class TransportMagazines { \
      class _xx_NLAW_F { \
        count = 0; \
      }; \
    };

  class ReammoBox_F;
  class NATO_Box_Base: ReammoBox_F {};
  class Box_NATO_Ammo_F: NATO_Box_Base {
    MACRO_NONLAW
  };
  class Box_NATO_WpsLaunch_F: NATO_Box_Base {
    MACRO_NONLAW
  };

  class IND_Box_Base: ReammoBox_F {};
  class Box_IND_WpsLaunch_F: IND_Box_Base {
      MACRO_NONLAW
  };
  class Box_IND_Ammo_F: IND_Box_Base {
    MACRO_NONLAW
  };

  class B_supplyCrate_F: ReammoBox_F {
    MACRO_NONLAW
  };
  class I_supplyCrate_F: B_supplyCrate_F {
    MACRO_NONLAW
  };
  class C_supplyCrate_F: ReammoBox_F {
    MACRO_NONLAW
  };

  class B_AssaultPack_rgr;
  class B_AssaultPack_rgr_LAT: B_AssaultPack_rgr {
    MACRO_NONLAW
  };
  class B_AssaultPack_rgr_ReconLAT: B_AssaultPack_rgr {
    MACRO_NONLAW
  };

  class B_Carryall_mcamo;
  class B_AssaultPack_mcamo_Ammo: B_Carryall_mcamo {
    MACRO_NONLAW
  };
  class B_Carryall_oli;
  class I_Fieldpack_oli_Ammo: B_Carryall_oli {
    MACRO_NONLAW
  };

  class B_AssaultPack_dgtl;
  class I_Fieldpack_oli_LAT: B_AssaultPack_dgtl {
    MACRO_NONLAW
  };

  class CargoNet_01_ammo_base_F;
  class B_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
    MACRO_NONLAW
  };
  class I_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
    MACRO_NONLAW
  };

  class Slingload_01_Base_F;
  class B_Slingload_01_Cargo_F: Slingload_01_Base_F {
    MACRO_NONLAW
  };

  class Tank_F;
  class APC_Tracked_01_base_F: Tank_F {
    MACRO_NONLAW
  };
  /*class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {
    MACRO_NONLAW
  };
  class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
    MACRO_NONLAW
  };
  class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
    MACRO_NONLAW
  };
  class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
    MACRO_NONLAW
  };*/

  class Car_F;
  class MRAP_01_base_F: Car_F {
    MACRO_NONLAW
  };
  /*class MRAP_01_gmg_base_F: MRAP_01_base_F {
    MACRO_NONLAW
  };
  class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {
    MACRO_NONLAW
  };
  class B_MRAP_01_F: MRAP_01_base_F {
    MACRO_NONLAW
  };
  class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
    MACRO_NONLAW
  };
  class B_MRAP_01_hmg_F: MRAP_01_hmg_base_F {
    MACRO_NONLAW
  };*/

  class MRAP_03_base_F: Car_F {
    MACRO_NONLAW
  };
  /*class MRAP_03_hmg_base_F: MRAP_03_base_F {
    MACRO_NONLAW
  };
  class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
    MACRO_NONLAW
  };
  class I_MRAP_03_F: MRAP_03_base_F {
    MACRO_NONLAW
  };
  class I_MRAP_03_hmg_F: MRAP_03_hmg_base_F {
    MACRO_NONLAW
  };
  class I_MRAP_03_gmg_F: MRAP_03_gmg_base_F {
    MACRO_NONLAW
  };*/

  class Wheeled_APC_F: Car_F {};
  class APC_Wheeled_03_base_F: Wheeled_APC_F {
    MACRO_NONLAW
  };
  class APC_Wheeled_01_base_F: Wheeled_APC_F {
    MACRO_NONLAW
  };
  /*class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {
    MACRO_NONLAW
  };
  class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
    MACRO_NONLAW
  };
  class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {
    MACRO_NONLAW
  };
  class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
    MACRO_NONLAW
  };*/
};
