
class CfgVehicles {
    class All {
        class Turrets;
    };

    class AllVehicles: All {
        class NewTurret {
            GVAR(Enabled) = 0;
            GVAR(MinDistance) = 200;
            GVAR(MaxDistance) = 5500;
            GVAR(DistanceInterval) = 5;
            class Turrets;
        };
        class CargoTurret;
    };

    // LAND VEHICLES
    class Land: AllVehicles {};

    class LandVehicle: Land {
        class CommanderOptics;
    };

    class Car: LandVehicle {
        class ACE_SelfActions {
            class ResetFCS {
                displayName = CSTRING(ResetFCS);
                condition = QUOTE(_player call FUNC(canResetFCS));
                statement = QUOTE([ARR_2(vehicle _player,[_player] call DEFUNC(common,getTurretIndex))] call DFUNC(reset););
                showDisabled = 0;
                icon = "";
            };
        };
    };

    class Tank: LandVehicle {
        class ACE_SelfActions {
            class ResetFCS {
                displayName = CSTRING(ResetFCS);
                condition = QUOTE(_player call FUNC(canResetFCS));
                statement = QUOTE([ARR_2(vehicle _player,[_player] call DEFUNC(common,getTurretIndex))] call DFUNC(reset););
                showDisabled = 0;
                icon = "";
            };
        };
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };

    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };

    class APC_Tracked_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};

    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                turretinfotype = "ACE_RscOptics_APC_Tracked_01_gunner";
                GVAR(MaxDistance) = 2000;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
                magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Red"};
            };
        };
    };

    class APC_Tracked_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                turretinfotype = "ACE_RscOptics_APC_Tracked_01_gunner";
                GVAR(MaxDistance) = 2000;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
                magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Green"};
            };
        };
    };
};
