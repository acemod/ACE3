class CfgVehicles {
    class All {
        class Turrets;
    };

    class AllVehicles: All {
        class NewTurret {
            class Turrets;
        };
    };

    class Air: AllVehicles {};
    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };
    };

    class Plane: Air {};
    class ParachuteBase: Helicopter {
        class Turrets;
    };

    class UAV: Plane {};
    class Helicopter_Base_F: Helicopter {
        class Turrets: Turrets {
            class CopilotTurret;
        };
        class AnimationSources;
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };

    class Heli_Light_01_base_F: Helicopter_Base_H {
        incomingMissileDetectionSystem = 16; // Vanilla: 0
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
        };
    };

    class Heli_Light_01_armed_base_F: Heli_Light_01_base_F {
        incomingMissileDetectionSystem = 16; // Vanilla: 0
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class Heli_Light_02_base_F: Helicopter_Base_H {
        driverCanEject = 1;
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        magazines[] = {"2000Rnd_762x51_Belt_T_Green", "12Rnd_PG_missiles", "168Rnd_CMFlare_Chaff_Magazine"}; // Switch gun magazine to 7.62mm from 6.5mm

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
        };
    };

    class Plane_Base_F: Plane {
        class Turrets {
            class CopilotTurret;
        };
    };

    #include "Heli_Attack_01_base_F.hpp"

    class Heli_Attack_02_base_F: Helicopter_Base_F {
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H {
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };

            class MainTurret: MainTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"}; // Switch gun magazine to 7.62mm from 6.5mm
                canEject = 1;
            };

            class RightDoorGun: MainTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"}; // Switch gun magazine to 7.62mm from 6.5mm
                canEject = 1;
            };
        };
    };

    class Heli_Transport_02_base_F: Helicopter_Base_H {
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
        };
    };

    class Heli_light_03_base_F: Helicopter_Base_F {
        lockDetectionSystem = 0; // Vanilla: 12
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
                showHMD = 1;
                weapons[] = {"Laserdesignator_mounted"}; // Add Laser Designator
                magazines[] = {"Laserbatteries"};
            };
        };
    };


    class Plane_CAS_01_base_F: Plane_Base_F {
        lockDetectionSystem = 12; // Vanilla: 8
        incomingMissileDetectionSystem = 16; // Vanilla: 24
    };

    class Plane_CAS_02_base_F: Plane_Base_F {
        lockDetectionSystem = 12; // Vanilla: 8
        incomingMissileDetectionSystem = 16; // Vanilla: 24
    };

    class Plane_Fighter_03_base_F: Plane_Base_F {
        lockDetectionSystem = 12; // Vanilla: 8
        incomingMissileDetectionSystem = 16; // Vanilla: 24
    };

    class UAV_02_base_F: UAV {
        weapons[] = {}; // Remove flare launcher
        magazines[] = {};
    };

    class UAV_02_CAS_base_F: UAV_02_base_F {
        weapons[] = {}; // Remove flare launcher
        magazines[] = {};
    };

    class Heli_Transport_03_base_F: Helicopter_Base_H {
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class Heli_Transport_04_base_F: Helicopter_Base_H {
        incomingMissileDetectionSystem = 16; // Vanilla: 24
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };

            class LoadmasterTurret: MainTurret {
                canEject = 1;
            };
        };
    };
};
