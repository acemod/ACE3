class CfgPatches {
  class AGM_Armour {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "Adanteh"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class CfgFunctions {
  class AGM_Armour {
    class AGM_Armour {
      file = "AGM_Armour\functions";
      class cookOff;
      class getHitPointBySelection;
      class handleDamage;
      class init;
    };
  };
};

class Extended_Init_EventHandlers {
  class AllVehicles {
    class AGM_Armour {
      init = "_this call AGM_Armour_fnc_init";
    };
  };
};

class CfgSFX {
  class AGM_CookOff {
    name = "Cook-Off";
    sounds[] = {"cookoff"};
    cookoff[] = {"\AGM_Armour\sounds\cookoff.wav",6,1.8,400,1,0,0,0};
    empty[] = {"",0,0,0,0,0,0,0};
  };
};

class CfgVehicles {
  /*
   * AGM_Armour_AmmoLocation:
   *   HitPoint classname that holds the magazine of the vehicle
   * AGM_Armour_CookOffLocations:
   *   Positions to spawn cookoff particle effects at
   * AGM_Armour_CookOffOnTurret:
   *   Positions placed on turret?
   *
   * These 2 will be introduced in v0.96:
   * AGM_Armour_TurretObject:
   *   Object to spawn to simulate turret flying off; "" to not spawn enything
   * AGM_Armour_TurretPosition:
   *   Position to spawn turret at
   *
   * All positions are Y-up, just like in Oxygen/Object Builder.
   */

  class Sound;
  class AGM_Sound_CookOff: Sound {
    sound = "AGM_CookOff";
    scope = 2;
  };

  class Land;
  class LandVehicle: Land {
    AGM_Armour_AmmoLocation = "HitTurret";
    AGM_Armour_CookOffLocations[] = {{0,-0.2,0}};
    AGM_Armour_CookOffOnTurret[]  = {0};
    explosionEffect = "";
  };
  class Tank: LandVehicle {
    // 2 hatches on the turret; fits most tanks
    AGM_Armour_CookOffLocations[] = {{-0.6,-0.3,1.65}, {0.5,-0.3,1.65}};
    AGM_Armour_CookOffOnTurret[]  = {1,                1              };
  };

  // Small explosions for cars with explosive ammunition
  class MRAP_01_gmg_base_F;
  class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
    explosionEffect = "FuelExplosion";
  };
  class MRAP_02_gmg_base_F;
  class O_MRAP_01_gmg_F: MRAP_02_gmg_base_F {
    explosionEffect = "FuelExplosion";
  };
  class MRAP_03_gmg_base_F;
  class I_MRAP_03_gmg_F: MRAP_03_gmg_base_F {
    explosionEffect = "FuelExplosion";
  };

  // Big explosions for tracked vehicles and wheeled APCs
  class Tank_F: Tank {
    explosionEffect = "FuelExplosionBig";
  };
  class Car_F;
  class Wheeled_APC_F: Car_F {
    explosionEffect = "FuelExplosionBig";
  };
  class APC_Wheeled_03_base_F: Wheeled_APC_F {
    explosionEffect = "FuelExplosionBig";
  };
  class APC_Wheeled_01_base_F: Wheeled_APC_F {
    explosionEffect = "FuelExplosionBig";
  };
  class APC_Wheeled_02_base_F: Wheeled_APC_F {
    explosionEffect = "FuelExplosionBig";
  };

  class B_MBT_01_base_F;
  class B_MBT_01_cannon_F: B_MBT_01_base_F {
    AGM_Armour_AmmoLocation = "HitHull";
    //AGM_Armour_TurretObject = "AGM_Turret_MBT_01";
    //AGM_Armour_TurretPosition[] = {3,3,0};
    AGM_Armour_CookOffLocations[] = {{-0.3,-0.3,1.8}};
    AGM_Armour_CookOffOnTurret[]  = {1};
  };
  class B_MBT_01_arty_base_F;
  class B_MBT_01_arty_F: B_MBT_01_arty_base_F {
    AGM_Armour_CookOffLocations[] = {{0.7,-0.3,3.5}};
    AGM_Armour_CookOffOnTurret[]  = {1};
  };
  class B_MBT_01_mlrs_base_F;
  class B_MBT_01_mlrs_F: B_MBT_01_mlrs_base_F {
    AGM_Armour_CookOffLocations[] = {{0,-0.3,1.65}};
    AGM_Armour_CookOffOnTurret[]  = {0};
  };
  class B_APC_Tracked_01_base_F;
  class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
    AGM_Armour_AmmoLocation = "HitHull";
    AGM_Armour_CookOffLocations[] = {{0.5,-0.3,1.3}};
    AGM_Armour_CookOffOnTurret[]  = {0};
  };
  class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
    AGM_Armour_CookOffLocations[] = {{-0.4,-0.3,1.9}, {0.3,-0.3,1.9}};
    AGM_Armour_CookOffOnTurret[]  = {1,                1            };
  };
  class B_APC_Wheeled_01_base_F;
  class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
    AGM_Armour_CookOffLocations[] = {{-0.3,0,1.85}, {0.3,0,1.85}};
    AGM_Armour_CookOffOnTurret[]  = {1,             1           };
  };

  class I_APC_tracked_03_base_F;
  class I_APC_tracked_03_cannon_F: I_APC_tracked_03_base_F {
    AGM_Armour_CookOffLocations[] = {{-0.4,-0.3,1.5}, {0.7,-0.3,1.5}};
    AGM_Armour_CookOffOnTurret[]  = {1,               1             };
  };
  class I_APC_Wheeled_03_base_F;
  class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
    AGM_Armour_CookOffLocations[] = {{0,-0.6,0}};
    AGM_Armour_CookOffOnTurret[]  = {0};
  };

  class O_MBT_02_base_F;
  class O_MBT_02_cannon_F: O_MBT_02_base_F {
    AGM_Armour_CookOffLocations[] = {{-0.6,-0.3,1.65}, {0.5,-0.3,1.65}};
    AGM_Armour_CookOffOnTurret[]  = {1,                1              };
  };
  class O_MBT_02_arty_base_F;
  class O_MBT_02_arty_F: O_MBT_02_arty_base_F {
    AGM_Armour_CookOffLocations[] = {{0.7,-0.3,3.5}};
    AGM_Armour_CookOffOnTurret[]  = {1};
  };
  class O_APC_Tracked_02_base_F;
  class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
    AGM_Armour_CookOffLocations[] = {{-0.4,0.2,3.6}, {0.3,0.2,3.6}};
    AGM_Armour_CookOffOnTurret[]  = {1,              1            };
  };
  class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
    AGM_Armour_CookOffLocations[] = {{0,-0.5,1.65}};
    AGM_Armour_CookOffOnTurret[]  = {1};
  };
  class O_APC_Wheeled_02_base_F;
  class O_APC_Wheeled_02_rcws_F: O_APC_Wheeled_02_base_F {
    AGM_Armour_AmmoLocation = "HitHull";
    AGM_Armour_CookOffLocations[] = {{0,-0.4,1}};
    AGM_Armour_CookOffOnTurret[]  = {0};
  };


  /*
  class O_MBT_02_base_F;
  class O_MBT_02_cannon_F: O_MBT_02_base_F {
    AGM_Armour_TurretObject = "AGM_Turret_MBT_02";
    AGM_Armour_TurretPosition[] = {0.9,3,1.5};
  };*/

  // Turret Objects
  /*
  class thingX;
  class AGM_Turret_MBT_01: thingX {
    scope = 1;
    model = "\A3\Structures_F\Wrecks\Wreck_Slammer_turret_F.p3d";
  };
  class AGM_Turret_MBT_02: thingX {
    scope = 1;
    model = "\A3\Structures_F\Wrecks\Wreck_T72_turret_F.p3d";
  };
  */
};

class CfgCloudlets {
  class AGM_CookOff {
    angle = 0;
    angleVar = 0;
    animationName = "";
    animationSpeed[] = {1};
    animationSpeedCoef = 1;
    beforeDestroyScript = "";
    bounceOnSurface = 0.6;
    bounceOnSurfaceVar = 0;
    circleRadius = 0;
    circleVelocity[] = {2,2,2};
    color[] = {{1,1,1,-4},{1,1,1,-3},{1,1,1,-2},{1,1,1,-1},{1,1,1,0}};
    colorCoef[] = {1,1,1,1};
    colorVar[] = {0,0,0,2};
    destroyOnWaterSurface = 0;
    destroyOnWaterSurfaceOffset = 0;
    interval = 0.004;
    keepOnSurface = 0;
    lifeTime = 1;
    lifeTimeVar = 0;
    moveVelocity[] = {0,4,0};
    moveVelocityVar[] = {1,2,1};
    moveVelocityVarConst[] = {0,0,0};
    onSurface = 1;
    onTimerScript = "";
    particleEffects = "";
    particleFSFrameCount = 32;
    particleFSIndex = 0;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
    particleType = "Billboard";
    position[] = {0,0,0};
    positionVar[] = {0,0,0};
    positionVarConst[] = {0,0,0};
    postEffects = "";
    randomDirectionIntensity = 1;
    randomDirectionIntensityVar = 2;
    randomDirectionPeriod = 5;
    randomDirectionPeriodVar = 1;
    rotationVelocity = 1;
    rotationVelocityVar = 3;
    rubbing = 0;
    size[] = {0.01,0.5,1,1,1.5,0.01,0.001};
    sizeCoef = 1;
    sizeVar = 0.1;
    surfaceOffset = 0;
    timerPeriod = 1;
    volume = 0.45;
    weight = 0.4;
  };
};
