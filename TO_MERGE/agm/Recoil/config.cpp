// SEE LICENSE.TXT FOR LICENSING INFORMATION

class CfgPatches {
  class AGM_Recoil {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "TaoSensai", "commy2"};
    authorUrl = "https://github.com/Taosenai/tmr";
  };
};

class CfgFunctions {
  class AGM_Recoil {
    class AGM_Recoil {
      file = "\AGM_Recoil\functions";
      class burstDispersion;
      class camshake;
    };
  };
};

class Extended_FiredBis_EventHandlers {
  class CAManBase {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == AGM_player) then {_this call AGM_Recoil_fnc_camshake; _this call AGM_Recoil_fnc_burstDispersion;};";
    };
  };
  class Tank {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
  class Car {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
  class Helicopter {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
  class Plane {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
  class Ship_F {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
  class StaticWeapon {
    class AGM_Recoil_CamShake {
      clientFiredBis = "if (_this select 0 == vehicle AGM_player) then {_this call AGM_Recoil_fnc_camshake;};";
    };
  };
};

// DOC: http://forums.bistudio.com/showthread.php?94464-explaining-the-cfgRecoils-array
class CfgRecoils {
  #define KICKBACK 0.07
  #define KICKBACKPRONE 0.05

  #define MUZZLECLIMB 0.01
  #define MUZZLERECOVERY -0.004

// BASE RECOILS
  pistolBase[]                 = {0,0.8*KICKBACK,0.9*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.9*MUZZLERECOVERY, 0.3,0,0};
  subMachineGunBase[]          = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  assaultRifleBase[]           = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  machinegunBase[]             = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  launcherBase[]               = {0,0,0};

// PISTOLS
  recoil_pistol_light[]        = {0,0.8*KICKBACK,0.9*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.9*MUZZLERECOVERY, 0.3,0,0};
  recoil_pistol_heavy[]        = {0,1.1*KICKBACK,1.4*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.4*MUZZLERECOVERY, 0.3,0,0};
  recoil_prone_pistol_light[]  = {0,0.8*KICKBACKPRONE,0.9*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.9*MUZZLERECOVERY, 0.3,0,0};
  recoil_prone_pistol_heavy[]  = {0,1.1*KICKBACKPRONE,1.4*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.4*MUZZLERECOVERY, 0.3,0,0};

// SUBMACHINE GUNS
  recoil_single_smg_01[]       = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_smg_01[]        = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_smg_01[]         = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_smg_01[] = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_prone_smg_01[]  = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_smg_01[]   = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_smg_02[]       = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_smg_02[]        = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_smg_02[]         = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_smg_02[] = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_prone_smg_02[]  = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_smg_02[]   = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_pdw[]          = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_pdw[]           = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_pdw[]            = {0,0.5*KICKBACK,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_pdw[]    = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_burst_prone_pdw[]     = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_pdw[]      = {0,0.5*KICKBACKPRONE,0.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.5*MUZZLERECOVERY, 0.3,0,0};

// ASSAULT RIFLES
  recoil_single_mx[]           = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_mx[]             = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_mx[]     = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_mx[]       = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_ktb[]          = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_ktb[]            = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_ktb[]    = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_ktb[]      = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_mk20[]         = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_mk20[]           = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_mk20[]   = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_mk20[]     = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_trg[]          = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_trg[]            = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_trg[]    = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_trg[]      = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_sdar[]         = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_sdar[]           = {0,0.8*KICKBACK,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_sdar[]   = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_sdar[]     = {0,0.8*KICKBACKPRONE,0.8*MUZZLECLIMB, 0.12,0,0, 0.15,0,0.8*MUZZLERECOVERY, 0.3,0,0};

// MACHINE GUNS
  recoil_single_mk200[]        = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_mk200[]          = {0,1*KICKBACK,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_mk200[]  = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_mk200[]    = {0,1*KICKBACKPRONE,1*MUZZLECLIMB, 0.12,0,0, 0.15,0,1*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_zafir[]        = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_zafir[]          = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_zafir[]  = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_zafir[]    = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};

// PRECISION RIFLES
  recoil_single_dmr[]          = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_dmr[]            = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_dmr[]    = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_dmr[]      = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_ebr[]          = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_ebr[]            = {0,1.5*KICKBACK,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_ebr[]    = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_auto_prone_ebr[]      = {0,1.5*KICKBACKPRONE,1.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,1.5*MUZZLERECOVERY, 0.3,0,0};

  recoil_single_gm6[]          = {0,2.5*KICKBACK,2.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,2.5*MUZZLERECOVERY, 0.3,0,0};
  recoil_single_prone_gm6[]    = {0,2.5*KICKBACKPRONE,2.5*MUZZLECLIMB, 0.12,0,0, 0.15,0,2.5*MUZZLERECOVERY, 0.3,0,0};

// LAUNCHERS
  recoil_single_law[]          = {0,0,0};
  recoil_single_nlaw[]         = {0,0,0};
  recoil_single_titan[]        = {0,0,0};
};

class CfgCameraShake {
  // What does this do, really? It seems like the engine no longer respects it.
  defaultCaliberCoefWeaponFire = 0;
};

// Completely disable BI's camshake on fire.
#define AGM_CAMSHAKEFIRE_BASE 0
#define AGM_CAMSHAKEFIRE_LESS 0
#define AGM_CAMSHAKEFIRE_MORE 0

// Go through all modes that have a camshakefire defined and change it to ours.
class CfgMovesBasic {
  class Default {
    camShakeFire = AGM_CAMSHAKEFIRE_BASE;
  };
};
class CfgMovesMaleSdr : CfgMovesBasic {
  class States {
    class AmovPercMstpSlowWrflDnon;
    class AmovPknlMstpSlowWrflDnon : AmovPercMstpSlowWrflDnon {
      camShakeFire = AGM_CAMSHAKEFIRE_LESS;
    };
    class AmovPercMstpSrasWrflDnon;
    class AmovPpneMstpSrasWrflDnon : AmovPercMstpSrasWrflDnon {
      camShakeFire = AGM_CAMSHAKEFIRE_LESS;
    };
    class AmovPknlMstpSrasWlnrDnon : Default {
      camShakeFire = AGM_CAMSHAKEFIRE_LESS;
    };
    class AmovPknlMrunSlowWrflDf;
    class AmovPknlMtacSlowWrflDf : AmovPknlMrunSlowWrflDf {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDfl;
    class AmovPknlMtacSlowWrflDfl : AmovPknlMrunSlowWrflDfl {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDl;
    class AmovPknlMtacSlowWrflDl : AmovPknlMrunSlowWrflDl {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDbl;
    class AmovPknlMtacSlowWrflDbl : AmovPknlMrunSlowWrflDbl {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDb;
    class AmovPknlMtacSlowWrflDb : AmovPknlMrunSlowWrflDb {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDbr;
    class AmovPknlMtacSlowWrflDbr : AmovPknlMrunSlowWrflDbr {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDr;
    class AmovPknlMtacSlowWrflDr : AmovPknlMrunSlowWrflDr {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMrunSlowWrflDfr;
    class AmovPknlMtacSlowWrflDfr : AmovPknlMrunSlowWrflDfr {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMstpSrasWrflDnon;
    class AmovPknlMwlkSrasWrflDf : AmovPknlMstpSrasWrflDnon {
      camShakeFire = AGM_CAMSHAKEFIRE_BASE;
    };
    class AmovPknlMrunSrasWrflDf;
    class AmovPknlMtacSrasWrflDf : AmovPknlMrunSrasWrflDf {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
    class AmovPknlMwlkSrasWpstDf;
    class AmovPknlMtacSrasWpstDf : AmovPknlMwlkSrasWpstDf {
      camShakeFire = AGM_CAMSHAKEFIRE_MORE;
    };
  };
};

// Ammo
class CfgAmmo {
  class MissileCore;
  class MissileBase: MissileCore {
    AGM_Recoil_shakeMultiplier = 2;
  };

  class BombCore;
  class LaserBombCore: BombCore {
    AGM_Recoil_shakeMultiplier = 2;
  };
  class Bo_Mk82: BombCore {
    AGM_Recoil_shakeMultiplier = 2;
  };

  class RocketCore;
  class ArtilleryRocketCore: RocketCore {
    AGM_Recoil_shakeMultiplier = 1.4;
  };
  class RocketBase: RocketCore {
    AGM_Recoil_shakeMultiplier = 1.4;
  };

  class BulletCore;
  class BulletBase: BulletCore {
    AGM_Recoil_shakeMultiplier = 1;
  };

  class ShotgunCore;
  class ShotgunBase: ShotgunCore {
    AGM_Recoil_shakeMultiplier = 1.1;
  };

  class ShellCore;
  class ShellBase: ShellCore {
    AGM_Recoil_shakeMultiplier = 3;
  };

  class SubmunitionCore;
  class SubmunitionBase: SubmunitionCore {
    AGM_Recoil_shakeMultiplier = 3;
  };

  class ShotDeployCore;
  class ShotDeployBase: ShotDeployCore {
    AGM_Recoil_shakeMultiplier = 3;
  };
};

// Weapons
// 1. Set the recoil profiles for all fire modes.
// 2. Set the shake multiplier. This determines the camshake for the weapon.
//     Ex: agm_recoil_shakeMultiplier = 1;

// disabled currently
#define SHAKEMULTIPLIER_BASE 0

class CfgWeapons {
  class CannonCore;
  class autocannon_Base_F: CannonCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };
  class autocannon_35mm: CannonCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };
  class cannon_120mm: CannonCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };
  class mortar_155mm_AMOS: CannonCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };
  class mortar_82mm: CannonCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };

  // No camshake for gatlings
  class gatling_20mm: CannonCore {
    agm_recoil_shakeMultiplier = 0;
  };
  class gatling_25mm: CannonCore {
    agm_recoil_shakeMultiplier = 0;
  };
  class gatling_30mm: CannonCore {
    agm_recoil_shakeMultiplier = 0;
  };

  class MGunCore;
  class MGun: MGunCore {
    agm_recoil_shakeMultiplier = SHAKEMULTIPLIER_BASE;
  };
  // No camshake for smoke launchers
  class SmokeLauncher: MGun {
    agm_recoil_shakeMultiplier = 0;
  };

  // No camshake for coax machine guns
  class LMG_RCWS;
  class LMG_M200: LMG_RCWS {
    agm_recoil_shakeMultiplier = 0;
  };
  class LMG_coax: LMG_RCWS {
    agm_recoil_shakeMultiplier = 0;
  };
  class LMG_Minigun: LMG_RCWS {
    agm_recoil_shakeMultiplier = 0;
  };
};

// Vehicles
class CfgVehicles {
  class LandVehicle;
  class Tank: LandVehicle {
    AGM_enableCamshake = 1;
  };
  class Car: LandVehicle {
    AGM_enableCamshake = 1;
  };
  class StaticWeapon: LandVehicle {
    AGM_enableCamshake = 1;
  };

  class Allvehicles;
  class Air: Allvehicles {
    AGM_enableCamshake = 1;
  };
};
