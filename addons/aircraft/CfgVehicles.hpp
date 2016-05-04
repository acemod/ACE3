
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
        //class UserActions;
    };

    class Heli_Light_01_base_F: Helicopter_Base_H {
        lockDetectionSystem = 0;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
        };
    };

    class Heli_Light_01_unarmed_base_F: Heli_Light_01_base_F {};

    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Heli_Light_01_armed_base_F: Heli_Light_01_base_F {
        lockDetectionSystem = 0;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };

    class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F {};

    class Heli_Light_02_base_F: Helicopter_Base_H {
        driverCanEject = 1;
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
        magazines[] = {"2000Rnd_762x51_Belt_T_Green","12Rnd_PG_missiles","168Rnd_CMFlare_Chaff_Magazine"};

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

    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {};

    class Heli_Attack_02_base_F: Helicopter_Base_F {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
            class MainTurret: MainTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"};
                canEject = 1;
            };
            class RightDoorGun: MainTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"};
                canEject = 1;
            };
        };

        /*class UserActions {
            class DoorL1_Open {
                available = 1;
                condition = "((this doorPhase 'door_L') == 0) AND Alive(this) AND driver this != player AND gunner this != player";
            };
            class DoorR1_Open: DoorL1_Open {
                condition = "((this doorPhase 'door_R') == 0) AND Alive(this) AND driver this != player AND gunner this != player";
            };
            class DoorL1_Close: DoorL1_Open {
                condition = "((this doorPhase 'door_L') > 0) AND Alive(this) AND driver this != player AND gunner this != player";
            };
            class DoorR1_Close: DoorL1_Close {
                condition = "((this doorPhase 'door_R') > 0) AND Alive(this) AND driver this != player AND gunner this != player";
            };
        };*/
    };

    class Heli_Transport_02_base_F: Helicopter_Base_H {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
                showHMD = 1;
            };
        };

        /*class UserActions: UserActions {
            class DoorL1_Open {
                available = 1;
                condition = "this animationPhase ""door_back_L"" < 0.5 AND Alive(this)";
            };
            class DoorR1_Open: DoorL1_Open {
                condition = "this animationPhase ""door_back_R"" < 0.5 AND Alive(this)";
            };
            class DoorL1_Close: DoorL1_Open {
                condition = "this animationPhase ""door_back_L"" > 0.5 AND Alive(this)";
            };
            class DoorR1_Close: DoorL1_Close {
                condition = "this animationPhase ""door_back_R"" > 0.5 AND Alive(this)";
            };
            class CargoRamp_Open: DoorL1_Open {
                userActionID = 52;
                displayName = CSTRING(OpenCargoRamp);
                textToolTip = CSTRING(OpenCargoRamp);
                position = "action_cargoramp";
                radius = 3.0;
                condition = "this animationPhase ""cargoramp_open"" < 0.5 AND Alive(this)";
                statement = "this animateDoor ['cargoramp_open', 1]";
            };
            class CargoRamp_Close: DoorL1_Close {
                userActionID = 55;
                displayName = CSTRING(CloseCargoRamp);
                textToolTip = CSTRING(CloseCargoRamp);
                position = "action_cargoramp";
                radius = 3.0;
                condition = "this animationPhase ""cargoramp_open"" > 0.5 AND Alive(this)";
                statement = "this animateDoor ['cargoramp_open', 0]";
            };
        };*/
    };

    class Heli_light_03_base_F: Helicopter_Base_F {};
    class I_Heli_light_03_base_F: Heli_light_03_base_F {
        lockDetectionSystem = 0;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;
        weapons[] = {"M134_minigun","missiles_DAR","CMFlareLauncher", "ACE_AIR_SAFETY" };
        magazines[] = {"5000Rnd_762x51_Yellow_Belt","24Rnd_missiles","168Rnd_CMFlare_Chaff_Magazine"};

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
                showHMD = 1;
                gunBeg = "commanderview";
                gunEnd = "laserstart";
                memoryPointGun = "laserstart";
                stabilizedInAxes = 3;
                weapons[] = {"Laserdesignator_mounted"};
                soundServo[] = {"",0.01,1,30};
                magazines[] = {"Laserbatteries"};
                inGunnerMayFire = 1;
            };
        };
    };

    class I_Heli_light_03_F: Heli_light_03_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class Heli_light_03_unarmed_base_F: Heli_light_03_base_F {};

    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {};

    class Plane_CAS_01_base_F: Plane_Base_F {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;

        class Turrets;

        #include <flightmodel_thunderbolt.hpp>
    };

    class Plane_CAS_02_base_F: Plane_Base_F {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;

        class Turrets;

        #include <flightmodel_yak.hpp>
    };

    class Plane_Fighter_03_base_F: Plane_Base_F {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;

        class Turrets;

        #include <flightmodel_alca.hpp>
    };

    class UAV_01_base_F: Helicopter_Base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class UAV_02_base_F: UAV {
        weapons[] = {};
        magazines[] = {};

        class Turrets {
            class MainTurret;
        };
    };

    class UAV_02_CAS_base_F: UAV_02_base_F {
        weapons[] = {};
        magazines[] = {};

        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class Heli_Transport_03_base_F: Helicopter_Base_H {};
    class B_Heli_Transport_03_base_F: Heli_Transport_03_base_F {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            //class MainTurret: MainTurret {};
            class RightDoorGun: MainTurret {};
        };
    };

    class B_Heli_Transport_03_unarmed_base_F: Heli_Transport_03_base_F {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            //class MainTurret: MainTurret {};
            //class RightDoorGun: MainTurret {};
        };
    };

    class Heli_Transport_04_base_F: Helicopter_Base_H {
        lockDetectionSystem = 12;
        incomingMissileDetectionSystem = 16;
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

    class O_Heli_Transport_04_bench_F: Heli_Transport_04_base_F {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class LoadmasterTurret: LoadmasterTurret {
                canEject = 1;
            };
        };
    };

    class O_Heli_Transport_04_covered_F: Heli_Transport_04_base_F {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class LoadmasterTurret: LoadmasterTurret {
                canEject = 1;
            };
        };
    };
};
