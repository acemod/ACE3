
class CfgVehicles {
    class All {
        class Turrets;
    };

    class AllVehicles: All {
        class ViewCargo;
        class NewTurret {
            class Turrets;
        };
    };

    class Land: AllVehicles {};

    class LandVehicle: Land {
        class CommanderOptics: NewTurret {
            class ViewOptics;
        };
    };

    class Tank: LandVehicle {
        class HitPoints;
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;
                };
            };
        };
    };

    class Tank_F: Tank {
        class ViewOptics;
        class HitPoints: HitPoints {
            class HitHull;
            class HitEngine;
            class HitLTrack;
            class HitRTrack;
        };
    };

    #define FUEL_FACTOR 0.165

    class BWA3_Puma_base: Tank_F {
        fuelCapacity = 600 * FUEL_FACTOR;

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ACE_fcs_enabled = 1;
                ACE_fcs_minDistance = 200;
                ACE_fcs_maxDistance = 9990;
                ACE_fcs_distanceInterval = 5;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };

    class BWA3_Leopard_base: Tank_F {
        fuelCapacity = 500 * FUEL_FACTOR;

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ACE_fcs_enabled = 1;
                ACE_fcs_minDistance = 200;
                ACE_fcs_maxDistance = 9990;
                ACE_fcs_distanceInterval = 5;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
