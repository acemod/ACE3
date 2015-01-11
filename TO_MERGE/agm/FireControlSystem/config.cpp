class CfgPatches {
  class AGM_FireControlSystem {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi","BadGuy (simon84)"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

// @todo: clean up inheritance and remove old code

class CfgFunctions {
  class AGM_FCS {
    class AGM_FCS {
      file = "AGM_FireControlSystem\functions";
      class adjustRange;
      class canUseFCS;
      class canUseRangefinder;
      class firedEH;
      class getAngle;
      class getImpactPoint;
      class getRange;
      class keyDown;
      class keyUp;
      class reset;
      class vehicleInit;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_FCS {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_FireControlSystem\clientInit.sqf'";
  };
};

class Extended_Init_EventHandlers {
  class AllVehicles {
    class AGM_FCS {
      clientInit = "_this call AGM_FCS_fnc_vehicleInit";
    };
  };
};

class AGM_Core_Default_Keys {
  class laseTarget {
    displayName = "$STR_AGM_FireControlSystem_LaseTarget";
    condition   = "call AGM_FCS_fnc_canUseRangefinder  || AGM_FCS_fnc_canUseFCS";
    statement   = "_range = call AGM_FCS_fnc_getRange; if (call AGM_FCS_fnc_canUseFCS) then {[_vehicle, _range] call AGM_FCS_fnc_keyDown};";
    conditionUp = "AGM_FCSEnabled && AGM_FCS_fnc_canUseFCS";
    statementUp = "_range = call AGM_FCS_fnc_getRange; if (AGM_FCSEnabled && AGM_FCS_fnc_canUseFCS) then {[_vehicle, _range] call AGM_FCS_fnc_keyUp};";
    key = 15;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class adjustRangeUp {
    displayName = "$STR_AGM_FireControlSystem_AdjustRangeUp";
    condition = "player == gunner _vehicle && {getNumber (configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'AGM_FCSEnabled') == 1}";
    statement = "[_vehicle, 50] call AGM_FCS_fnc_adjustRange";
    key = 201;
    shift = 0;
    control = 0;
    alt = 0;
    allowHolding = 1;
  };
  class adjustRangeDown: adjustRangeUp {
    displayName = "$STR_AGM_FireControlSystem_AdjustRangeDown";
    statement = "[_vehicle, -50] call AGM_FCS_fnc_adjustRange";
    key = 209;
  };
};

class CfgVehicles {
  class All {
    class Turrets;
  };

  class AllVehicles: All {
    AGM_FCSEnabled = 0;
    AGM_FCSMinDistance = 200;
    AGM_FCSMaxDistance = 9990;
    AGM_FCSDistanceInterval = 5;
    class NewTurret {
      class Turrets;
    };
    class CargoTurret;
  };

  class Land: AllVehicles {};

  class LandVehicle: Land {
    class CommanderOptics;
  };

  class Car: LandVehicle {
    class AGM_SelfActions {
      class AGM_ResetFCS {
        displayName = "$STR_AGM_FireControlSystem_ResetFCS";
        condition = "(count (vehicle _player getVariable ['AGM_FCSMagazines', []]) > 1) and (_player == gunner (vehicle _player))";
        statement = "[vehicle _player] call AGM_FCS_fnc_reset;";
        showDisabled = 0;
        priority = -1;
      };
    };
  };

  class Tank: LandVehicle {
    AGM_FCSEnabled = 1; // all tracked vehicles get one by default
    class AGM_SelfActions {
      class AGM_ResetFCS {
        displayName = "$STR_AGM_FireControlSystem_ResetFCS";
        enableInside = 1;
        condition = "(count (_vehicle getVariable ['AGM_FCSMagazines', []]) > 1) and (_player == gunner _vehicle)";
        statement = "[vehicle _player] call AGM_FCS_fnc_reset;";
        showDisabled = 0;
        priority = 1;
        icon = "";
      };
    };
    class Turrets {
      class MainTurret: NewTurret {
        class Turrets {
          class CommanderOptics;
        };
      };
    };
  };

  class APC: Tank {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class Air: AllVehicles {};

  class Helicopter: Air {
    class Turrets {
      class MainTurret;
    };
  };

  class Plane: Air {};

  class Ship: AllVehicles {
    class Turrets {
      class MainTurret;
    };
  };

  class Helicopter_Base_F: Helicopter {
    class Turrets: Turrets {
      class CopilotTurret;
    };
  };

  class Helicopter_Base_H: Helicopter_Base_F {
    class Turrets: Turrets {
      class CopilotTurret;
    };
  };

  class Heli_Light_01_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
    };*/
  };

  class B_Heli_Light_01_F: Heli_Light_01_base_F {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
      class CargoTurret_03: CargoTurret_02 {};
      class CargoTurret_04: CargoTurret_01 {};
    };*/
  };

  class Heli_Light_01_armed_base_F: Heli_Light_01_base_F {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
    };*/
  };

  class Heli_Light_02_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
    };*/
  };

  class Plane_Base_F: Plane {
    class Turrets {
      class CopilotTurret;
    };
  };

  class Heli_Attack_01_base_F: Helicopter_Base_F {
    AGM_FCSEnabled = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class Heli_Attack_02_base_F: Helicopter_Base_F {
    AGM_FCSEnabled = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class Heli_Transport_01_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class MainTurret: MainTurret {};
      class RightDoorGun: MainTurret {};
    };*/
  };

  class Heli_Transport_02_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class I_Heli_light_03_base_F: Helicopter_Base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class I_Heli_light_03_F: I_Heli_light_03_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class Plane_CAS_01_base_F: Plane_Base_F {
    class Turrets;
  };

  class Plane_CAS_02_base_F: Plane_Base_F {
    class Turrets;
  };

  class Plane_Fighter_03_base_F: Plane_Base_F {
    class Turrets;
  };

  class Tank_F: Tank {
    class Turrets {
      class MainTurret: NewTurret {
        class Turrets {
          class CommanderOptics;//: CommanderOptics {};
        };
      };
    };
  };

  class Car_F: Car {
    class Turrets {
      class MainTurret;
    };
  };

  class Wheeled_APC_F: Car_F {
    class Turrets {
      class MainTurret: NewTurret {
        class Turrets {
          class CommanderOptics;//: CommanderOptics {};
        };
      };
    };
  };

  class APC_Tracked_01_base_F: Tank_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets;
      };
    };*/
  };

  class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
    AGM_FCSEnabled = 0;
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
      class CommanderOptics: CommanderOptics {};
    };*/
  };

  class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
    AGM_FCSEnabled = 0;
  };

  class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        magazines[] += {"AGM_120Rnd_35mm_ABM_shells_Tracer_Red"};
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class APC_Tracked_02_base_F: Tank_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };
      };
    };*/
  };

  class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};

  class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        magazines[] += {"AGM_120Rnd_35mm_ABM_shells_Tracer_Green"};
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class APC_Tracked_03_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class MBT_03_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class MBT_01_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class B_MBT_01_base_F: MBT_01_base_F {};

  class B_MBT_01_cannon_F: B_MBT_01_base_F {};

  class MBT_01_arty_base_F: MBT_01_base_F {
    AGM_FCSEnabled = 0;
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };
      };
    };*/
  };

  class MBT_01_mlrs_base_F: MBT_01_base_F {
    AGM_FCSEnabled = 0;
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets;
      };
    };*/
  };

  class MBT_02_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class MBT_02_arty_base_F: MBT_02_base_F {
    AGM_FCSEnabled = 0;
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };
      };
    };*/
  };

  class Ship_F: Ship {};

  class Boat_F: Ship_F {};

  class Boat_Armed_01_base_F: Boat_F {
    class Turrets: Turrets {
      class FrontTurret;
      class RearTurret: FrontTurret {};
    };
  };

  /*class Boat_Armed_01_minigun_base_F: Boat_Armed_01_base_F {
    class Turrets: Turrets {
      class FrontTurret: FrontTurret {};
      class RearTurret: RearTurret {};
    };
  };*/

  class Truck_F: Car_F {
    //class Turrets: Turrets {};
  };

  class MRAP_01_base_F: Car_F {};

  class MRAP_01_gmg_base_F: MRAP_01_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class B_MRAP_01_F: MRAP_01_base_F {
    class Turrets;
  };

  class MRAP_02_base_F: Car_F {};

  class MRAP_02_hmg_base_F: MRAP_02_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class MRAP_02_gmg_base_F: MRAP_02_hmg_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };

  class O_MRAP_02_F: MRAP_02_base_F {
    class Turrets;
  };

  class Offroad_01_base_F: Car_F {};

  class C_Offroad_01_F: Offroad_01_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
      class CargoTurret_03: CargoTurret_01 {};
      class CargoTurret_04: CargoTurret_03 {};
    };*/
  };

  class Offroad_01_repair_base_F: Offroad_01_base_F {
    class Turrets;
  };

  class I_G_Offroad_01_F: Offroad_01_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
      class CargoTurret_03: CargoTurret_01 {};
      class CargoTurret_04: CargoTurret_03 {};
    };*/
  };

  class Offroad_01_armed_base_F: Offroad_01_base_F {
    /*class Turrets: Turrets {
      class M2_Turret: MainTurret {};
    };*/
  };

  class MRAP_03_base_F: Car_F {
    /*class Turrets: Turrets {
      class CommanderTurret: MainTurret {};
    };*/
  };

  class MRAP_03_hmg_base_F: MRAP_03_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
      class CommanderTurret: CommanderTurret {};
    };*/
  };

  class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
      class CommanderTurret: CommanderTurret {};
    };*/
  };

  class Truck_01_base_F: Truck_F {
    class Turrets;
  };

  class B_Truck_01_transport_F: Truck_01_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class Truck_02_base_F: Truck_F {
    class Turrets;
  };

  class O_Truck_02_covered_F: Truck_02_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class O_Truck_02_transport_F: Truck_02_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class I_Truck_02_covered_F: Truck_02_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class I_Truck_02_transport_F: Truck_02_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class Truck_03_base_F: Truck_F {
    class Turrets;
  };

  class O_Truck_03_transport_F: Truck_03_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class O_Truck_03_covered_F: Truck_03_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class Hatchback_01_base_F: Car_F {
    class Turrets;
  };

  class SUV_01_base_F: Car_F {
    class Turrets;
  };

  class B_Truck_01_mover_F: B_Truck_01_transport_F {
    class Turrets;
  };

  class Van_01_base_F: Truck_F {
    class Turrets;
  };

  class C_Van_01_transport_F: Van_01_base_F {
    //class Turrets: Turrets {};
  };

  class I_G_Van_01_transport_F: Van_01_base_F {
    /*class Turrets: Turrets {
      class CargoTurret_L1: CargoTurret {};
      class CargoTurret_L2: CargoTurret_L1 {};
      class CargoTurret_L3: CargoTurret_L1 {};
      class CargoTurret_L4: CargoTurret_L1 {};
      class CargoTurret_L5: CargoTurret_L1 {};

      class CargoTurret_R1: CargoTurret_L1 {};
      class CargoTurret_R2: CargoTurret_L1 {};
      class CargoTurret_R3: CargoTurret_L1 {};
      class CargoTurret_R4: CargoTurret_L1 {};
      class CargoTurret_R5: CargoTurret_L1 {};
    };*/
  };

  class Kart_01_Base_F: Car_F {
    class Turrets;
  };

  class B_Heli_Transport_03_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class MainTurret: MainTurret {};
      class RightDoorGun: MainTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class B_Heli_Transport_03_unarmed_base_F: B_Heli_Transport_03_base_F {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class MainTurret: MainTurret {};
      class RightDoorGun: MainTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class Heli_Transport_04_base_F: Helicopter_Base_H {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class LoadmasterTurret: MainTurret {};
    };*/
  };

  class O_Heli_Transport_04_bench_F: Heli_Transport_04_base_F {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class LoadmasterTurret: LoadmasterTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
      class CargoTurret_03: CargoTurret_01 {};
      class CargoTurret_04: CargoTurret_01 {};
      class CargoTurret_05: CargoTurret_01 {};
      class CargoTurret_06: CargoTurret_05 {};
      class CargoTurret_07: CargoTurret_05 {};
      class CargoTurret_08: CargoTurret_05 {};
    };*/
  };

  class O_Heli_Transport_04_covered_F: Heli_Transport_04_base_F {
    /*class Turrets: Turrets {
      class CopilotTurret: CopilotTurret {};
      class LoadmasterTurret: LoadmasterTurret {};

      class CargoTurret_01: CargoTurret {};
      class CargoTurret_02: CargoTurret_01 {};
    };*/
  };

  class APC_Wheeled_01_base_F: Wheeled_APC_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };
      };
    };*/
  };

  class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};

  class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
    AGM_FCSEnabled = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class APC_Wheeled_02_base_F: Wheeled_APC_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {
        class Turrets;
      };

      class CommanderOptics: CommanderOptics {};
    };*/
  };

  class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class APC_Wheeled_03_base_F: Wheeled_APC_F {
    AGM_FCSEnabled = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        /*class Turrets: Turrets {
          class CommanderOptics: CommanderOptics {};
        };*/
      };
    };
  };

  class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {};

  class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
    /*class Turrets: Turrets {
      class MainTurret: MainTurret {};
    };*/
  };
};

// disable locking, so it doesn't interfere with our system
class CfgWeapons {
  class CannonCore;
  class cannon_120mm: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };
  class autocannon_Base_F: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };
  class autocannon_35mm: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
    magazines[] += {"AGM_120Rnd_35mm_ABM_shells","AGM_120Rnd_35mm_ABM_shells_Tracer_Red","AGM_120Rnd_35mm_ABM_shells_Tracer_Green","AGM_120Rnd_35mm_ABM_shells_Tracer_Yellow"};
  };
  /*class Cannon_30mm_Plane_CAS_02_F: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };*/

  /*class gatling_20mm: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };
  class gatling_25mm: CannonCore {
    canLock = 0;
  };
  class gatling_30mm: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };
  class Gatling_30mm_Plane_CAS_01_F: CannonCore {
    canLock = 0;
    ballisticsComputer = 0;
  };*/

  /*class MGunCore;
  class M134_minigun: MGunCore {
    canLock = 0;
  };

  class MGun: MGunCore {};
  class LMG_RCWS: MGun {
    canLock = 0;
    ballisticsComputer = 0;
  };
  class HMG_127: LMG_RCWS {
    ballisticsComputer = 0;
  };
  class GMG_F: MGun {
    canLock = 0;
    ballisticsComputer = 0;
  };*/

  // fix mrco having an invisible rangefinder
  class ItemCore;
  class optic_MRCO: ItemCore {
    weaponInfoType = "RscWeaponZeroing";
  };
};

class CfgMagazines {
  class 680Rnd_35mm_AA_shells;
  class 680Rnd_35mm_AA_shells_Tracer_Red;
  class 680Rnd_35mm_AA_shells_Tracer_Green;
  class 680Rnd_35mm_AA_shells_Tracer_Yellow;

  class AGM_120Rnd_35mm_ABM_shells: 680Rnd_35mm_AA_shells {
    ammo = "AGM_B_35mm_ABM";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM";
  };
  class AGM_120Rnd_35mm_ABM_shells_Tracer_Red: 680Rnd_35mm_AA_shells_Tracer_Red {
    ammo = "AGM_B_35mm_ABM_Tracer_Red";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM-T";
  };
  class AGM_120Rnd_35mm_ABM_shells_Tracer_Green: 680Rnd_35mm_AA_shells_Tracer_Green {
    ammo = "AGM_B_35mm_ABM_Tracer_Green";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM-T";
  };
  class AGM_120Rnd_35mm_ABM_shells_Tracer_Yellow: 680Rnd_35mm_AA_shells_Tracer_Yellow {
    ammo = "AGM_B_35mm_ABM_Tracer_Yellow";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM-T";
  };
};

class CfgAmmo {
  class B_35mm_AA;
  class B_35mm_AA_Tracer_Red;
  class B_35mm_AA_Tracer_Green;
  class B_35mm_AA_Tracer_Yellow;

  class AGM_B_35mm_ABM: B_35mm_AA {
    AGM_Airburst = 1;
    deflecting = 0;
  };
  class AGM_B_35mm_ABM_Tracer_Red: B_35mm_AA_Tracer_Red {
    AGM_Airburst = 1;
    deflecting = 0;
  };
  class AGM_B_35mm_ABM_Tracer_Green: B_35mm_AA_Tracer_Green {
    AGM_Airburst = 1;
    deflecting = 0;
  };
  class AGM_B_35mm_ABM_Tracer_Yellow: B_35mm_AA_Tracer_Yellow {
    AGM_Airburst = 1;
    deflecting = 0;
  };

  class AGM_B_35mm_ABM_Helper: B_35mm_AA {
    indirectHitRange = 6;
    simulation = "shotRocket";
    timeToLive = 0;
  };
};

#include <Optics.hpp>
