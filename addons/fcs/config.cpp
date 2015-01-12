#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {ace_core, ace_interaction};
    version = "1.0";
    versionStr = "1.0";
    versionAr[] = {1,0,0};
    author[] = {"KoffeinFlummi","BadGuy (simon84)"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE(call compile preprocessFileLineNumbers PATHTOF(XEH_clientInit.sqf));
  };
};

class Extended_Init_EventHandlers {
  class AllVehicles {
    class ADDON {
      clientInit = QUOTE(_this call FUNC(vehicleInit));
    };
  };
};

class EGVAR(Core, Default_Keys) {
  class laseTarget {
    displayName = $STR_ACE_FireControlSystem_LaseTarget;
    condition   = QUOTE(call FUNC(canUseRangefinder) || FUNC(canUseFCS));
    statement   = QUOTE(_range = call FUNC(getRange); if (call FUNC(canUseFCS)) then {[_vehicle, _range] call FUNC(keyDown)};);
    conditionUp = QUOTE(GVAR(enabled) && FUNC(canUseFCS));
    statementUp = QUOTE(_range = call FUNC(getRange); if (GVAR(enabled) && FUNC(canUseFCS)) then {[_vehicle, _range] call FUNC(keyUp)};);
    key = 15;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class adjustRangeUp {
    displayName = $STR_ACE_FireControlSystem_AdjustRangeUp;
    condition = QUOTE(ACE_player == gunner _vehicle && {getNumber (configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> QGVAR(Enabled)) == 1});
    statement = QUOTE([_vehicle, 50] call FUNC(adjustRange));
    key = 201;
    shift = 0;
    control = 0;
    alt = 0;
    allowHolding = 1;
  };
  class adjustRangeDown: adjustRangeUp {
    displayName = $STR_ACE_FireControlSystem_AdjustRangeDown;
    statement = QUOTE([_vehicle, -50] call FUNC(adjustRange));
    key = 209;
  };
};

class CfgVehicles {
  class All {
    class Turrets;
  };

  class AllVehicles: All {
    GVAR(Enabled) = 0;
    GVAR(MinDistance) = 200;
    GVAR(MaxDistance) = 9990;
    GVAR(DistanceInterval) = 5;
    class NewTurret {
      class Turrets;
    };
    class CargoTurret;
  };

  class Land: AllVehicles {};

  class LandVehicle: Land {
    class CommanderOptics;
  };

  // WHEELED
  class Car: LandVehicle {
    class ACE_SelfActions {
      class ResetFCS {
        displayName = $STR_AGM_FireControlSystem_ResetFCS;
        enableInside = 1;
        condition = QUOTE((count (_vehicle getVariable [QGVAR(Magazines), []]) > 1) and (_player == gunner _vehicle));
        statement = QUOTE([vehicle _player] call FUNC(reset););
        showDisabled = 0;
        priority = 1;
        icon = "";
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
          class CommanderOptics;
        };
      };
    };
  };

  class APC_Wheeled_01_base_F: Wheeled_APC_F {};
  class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};
  class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
    GVAR(Enabled) = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class APC_Wheeled_03_base_F: Wheeled_APC_F {
    GVAR(Enabled) = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  // TRACKED
  class Tank: LandVehicle {
    GVAR(Enabled) = 1; // all tracked vehicles get one by default
    class ACE_SelfActions {
      class ResetFCS {
        displayName = $STR_AGM_FireControlSystem_ResetFCS;
        enableInside = 1;
        condition = QUOTE((count (_vehicle getVariable [QGVAR(Magazines), []]) > 1) and (_player == gunner _vehicle));
        statement = QUOTE([vehicle _player] call FUNC(reset););
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

  class Tank_F: Tank {
    class Turrets {
      class MainTurret: NewTurret {
        class Turrets {
          class CommanderOptics;
        };
      };
    };
  };

  class MBT_01_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class B_MBT_01_base_F: MBT_01_base_F {};
  class B_MBT_01_cannon_F: B_MBT_01_base_F {};
  class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };
  class MBT_01_arty_base_F: MBT_01_base_F {
    GVAR(Enabled) = 0;
  };
  class MBT_01_mlrs_base_F: MBT_01_base_F {
    GVAR(Enabled) = 0;
  };

  class MBT_02_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };
  class MBT_02_arty_base_F: MBT_02_base_F {
    GVAR(Enabled) = 0;
  };

  class MBT_03_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class APC_Tracked_01_base_F: Tank_F {};
  class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};
  class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
    GVAR(Enabled) = 0;
  };
  class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
    GVAR(Enabled) = 0;
  };
  class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
        magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Red"};
      };
    };
  };

  class APC_Tracked_02_base_F: Tank_F {};
  class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};
  class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Green"};
      };
    };
  };

  class APC_Tracked_03_base_F: Tank_F {
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  // HELICOPTERS
  class Air: AllVehicles {};

  class Helicopter: Air {
    class ACE_SelfActions {
      class ResetFCS {
        displayName = $STR_AGM_FireControlSystem_ResetFCS;
        enableInside = 1;
        condition = QUOTE((count (_vehicle getVariable [QGVAR(Magazines), []]) > 1) and (_player == gunner _vehicle));
        statement = QUOTE([vehicle _player] call FUNC(reset););
        showDisabled = 0;
        priority = 1;
        icon = "";
      };
    };
    class Turrets {
      class MainTurret;
    };
  };

  class Helicopter_Base_F: Helicopter {
    class Turrets: Turrets {
      class CopilotTurret;
    };
  };

  class Heli_Attack_01_base_F: Helicopter_Base_F {
    GVAR(Enabled) = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };

  class Heli_Attack_02_base_F: Helicopter_Base_F {
    GVAR(Enabled) = 1;
    class Turrets: Turrets {
      class MainTurret: MainTurret {
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;
      };
    };
  };
};

class CfgWeapons {
  // disable locking, so it doesn't interfere with our system
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
    magazines[] += {"ACE_120Rnd_35mm_ABM_shells","ACE_120Rnd_35mm_ABM_shells_Tracer_Red","ACE_120Rnd_35mm_ABM_shells_Tracer_Green","ACE_120Rnd_35mm_ABM_shells_Tracer_Yellow"};
  };

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

  class ACE_120Rnd_35mm_ABM_shells: 680Rnd_35mm_AA_shells {
    ammo = "ACE_B_35mm_ABM";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM";
  };
  class ACE_120Rnd_35mm_ABM_shells_Tracer_Red: 680Rnd_35mm_AA_shells_Tracer_Red {
    ammo = "ACE_B_35mm_ABM_Tracer_Red";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM-T";
  };
  class ACE_120Rnd_35mm_ABM_shells_Tracer_Green: 680Rnd_35mm_AA_shells_Tracer_Green {
    ammo = "ACE_B_35mm_ABM_Tracer_Green";
    count = 120;
    displayName = "35mm ABM Shells";
    displayNameShort = "35mm ABM-T";
  };
  class ACE_120Rnd_35mm_ABM_shells_Tracer_Yellow: 680Rnd_35mm_AA_shells_Tracer_Yellow {
    ammo = "ACE_B_35mm_ABM_Tracer_Yellow";
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

  class ACE_B_35mm_ABM: B_35mm_AA {
    GVAR(Airburst) = 1;
    deflecting = 0;
  };
  class ACE_B_35mm_ABM_Tracer_Red: B_35mm_AA_Tracer_Red {
    GVAR(Airburst) = 1;
    deflecting = 0;
  };
  class ACE_B_35mm_ABM_Tracer_Green: B_35mm_AA_Tracer_Green {
    GVAR(Airburst) = 1;
    deflecting = 0;
  };
  class ACE_B_35mm_ABM_Tracer_Yellow: B_35mm_AA_Tracer_Yellow {
    GVAR(Airburst) = 1;
    deflecting = 0;
  };

  class ACE_B_35mm_ABM_Helper: B_35mm_AA {
    indirectHitRange = 6;
    simulation = "shotRocket";
    timeToLive = 0;
  };
};

#include <Optics.hpp>
